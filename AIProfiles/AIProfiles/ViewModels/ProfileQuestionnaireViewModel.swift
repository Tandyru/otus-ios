//
//  ProfileQuestionnaireViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

import Foundation
import Combine

class ProfileQuestionnaireViewModel: ObservableObject, Equatable {
    @Published var currentQuestion: String?
    @Published var answer: String = ""
    @Published var parameters: [PreferenceParameterType] = []
    @Published var isCompleted: Bool = false
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var canFinishEarly: Bool = false
    
    @Inject private var llmService: LLMQuestionnaireService
    
    private(set) var currentParamType: PreferenceType?
    private(set) var currentParamOptions: [String]?
    private let profilePurpose: String
    private var cancellables = Set<AnyCancellable>()
    private let id = UUID()
    
    init(purpose: String) {
        self.profilePurpose = purpose
    }
    
    static func == (lhs: ProfileQuestionnaireViewModel, rhs: ProfileQuestionnaireViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func startQuestionnaire() {
        askNextQuestion()
    }
    
    func skipQuestion() {
        answer = ""
        askNextQuestion()
    }
    
    func submitAnswer() {
        guard !answer.isEmpty, let paramType = currentParamType else {
            askNextQuestion()
            return
        }

        Task {
            do {
                let param = try createParameter(from: answer, paramType: paramType, options: currentParamOptions)
                await MainActor.run {
                    parameters.append(param)
                    answer = ""
                    if parameters.count >= 3 { // Например, после 3 вопросов
                        canFinishEarly = true
                    }
                    askNextQuestion()
                }
            } catch {
                await MainActor.run {
                    errorMessage = "Ошибка обработки ответа: \(error.localizedDescription)"
                }
            }
        }
    }
    
    func finishEarly() {
        isCompleted = true
        currentQuestion = nil
        self.currentParamType = nil
        self.currentParamOptions = nil
    }
    
    private func askNextQuestion() {
        isLoading = true
        Task {
            do {
                let (question, paramType, options) = try await generateNextQuestion()
                await MainActor.run {
                    if let paramType {
                        currentQuestion = question
                        self.currentParamType = paramType
                        self.currentParamOptions = options
                    } else {
                        isCompleted = true
                        currentQuestion = nil
                        self.currentParamType = nil
                        self.currentParamOptions = nil
                    }
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    errorMessage = "Ошибка генерации вопроса: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }
    }
    
    private func generateNextQuestion(retries: Int = 3) async throws -> (String, PreferenceType?, [String]?) {
        do {
            return try await llmService.generateNextQuestion(profilePurpose: profilePurpose,
                                                             existingParams: parameters)
        } catch {
            print("llmService.generateNextQuestion thrown error: \(error)")
            if retries > 0 {
                return try await generateNextQuestion(retries: retries - 1)
            } else {
                throw error
            }
        }
    }
    
    private func createParameter(from answer: String, paramType: PreferenceType, options: [String]?) throws -> PreferenceParameterType {
        let id = UUID().uuidString
        let title = currentQuestion ?? "Parameter"
        
        switch paramType {
        case .boolean:
            let value = answer.lowercased() == "yes" || answer.lowercased() == "true"
            return .boolean(BooleanParameter(id: id, title: title, value: value))
            
        case .singleChoice:
            let options = options ?? ["Yes", "No"]
            return .singleChoice(SingleChoiceParameter(id: id,
                                                       title: title,
                                                       options: options,
                                                       selectedOption: answer))
            
        case .multipleChoice:
            let selectedOptions = answer.components(separatedBy: ",")
                .map { $0.trimmingCharacters(in: .whitespaces) }
            return .multipleChoice(MultipleChoiceParameter(id: id,
                                                           title: title,
                                                           options: options ?? ["Option 1", "Option 2"],
                                                           selectedOptions: selectedOptions))
            
        case .range:
            let value = Int(answer) ?? 5 // Default to 5 if invalid
            return .range(RangeParameter(id: id, title: title, min: 1, max: 10, currentValue: value))
            
        case .text:
            return .text(TextParameter(id: id, title: title, value: answer))
            
//        default:
//            throw NSError(domain: "Unsupported parameter type", code: -1)
        }
    }
    

}
