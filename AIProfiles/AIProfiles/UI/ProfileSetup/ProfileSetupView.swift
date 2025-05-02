//
//  ProfileSetupView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI

struct ProfileSetupView: View {
    @StateObject var viewModel: ProfileSetupViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var title: String
    @State private var purpose: String
    @State private var parameters: [PreferenceParameterType]
    @State private var showingTypeSelection = false
    @State private var selectedParameterIndex: Int?
    @State private var showingParameterDetails = false
    @State private var showingQuestionnaire = false
    @State private var selectedType: PreferenceType?
    @State private var questionnaireViewModel: ProfileQuestionnaireViewModel?
    
    private let viewModelProvider: ViewModelProvider
    private let existingProfile: Profile?
    
    init(viewModelProvider: ViewModelProvider, existingProfile: Profile? = nil) {
        self.viewModelProvider = viewModelProvider
        self.existingProfile = existingProfile
        _viewModel = StateObject(wrappedValue: viewModelProvider.profileSetupViewModel.value)
        _title = State(initialValue: existingProfile?.title ?? "")
        _purpose = State(initialValue: existingProfile?.purpose ?? "")
        _parameters = State(initialValue: existingProfile?.parameters ?? [])
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Название профиля", text: $title)
                    .font(.headline)
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $purpose)
                        .frame(minHeight: 60)
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.systemGray6))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                    if purpose.isEmpty {
                        Text("Введите цель профиля")
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .allowsHitTesting(false)
                    }
                }
            } header: {
//                Text("Основные данные")
//                    .font(.headline)
//                    .foregroundColor(.accentColor)
//                    .padding(.vertical, 8)
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color(.systemGray6))
            Section("Параметры") {
                ForEach(parameters.indices, id: \.self) { index in
                    Button(action: {
                        selectedParameterIndex = index
                        showingParameterDetails = true
                    }) {
                        ParameterRowView(parameter: parameters[index])
                    }
                }
                .onDelete { indices in
                    parameters.remove(atOffsets: indices)
                }
                
                Button("Добавить параметр") {
                    showingTypeSelection = true
                }
                Button("Use AI Assistant") {
                    questionnaireViewModel = ProfileQuestionnaireViewModel(purpose: purpose)
                }
                .sheet(isPresented: $showingQuestionnaire, onDismiss: {
                    if let viewModel = questionnaireViewModel, viewModel.isCompleted {
                        var existingIDs = Set(parameters.map { $0.id })
                        let newParams = viewModel.parameters.filter { !existingIDs.contains($0.id) }
                        parameters.append(contentsOf: newParams)
                    }
                    questionnaireViewModel = nil
                }) {
                    if let viewModel = questionnaireViewModel {
                        QuestionnaireView(viewModel: viewModel)
                    }
                }
                .onChange(of: questionnaireViewModel) { newValue in
                    if newValue != nil {
                        showingQuestionnaire = true
                    }
                }
            }
        }
        .sheet(isPresented: $showingTypeSelection) {
            ParameterTypePicker(selectedType: $selectedType)
        }
        .navigationDestination(isPresented: $showingParameterDetails) {
            if let index = selectedParameterIndex {
                ParameterDetailView(
                    parameter: $parameters[index],
                    onDelete: {
                        parameters.remove(at: index)
                        selectedParameterIndex = nil
                        showingParameterDetails = false
                    }
                )
            }
        }
        .onChange(of: selectedType) { newType in
            if let type = newType {
                addParameter(of: type)
                selectedType = nil
                showingTypeSelection = false
            }
        }
//        .navigationTitle(existingProfile != nil ? "Профиль" : "Новый профиль")
        .onAppear {
            viewModel.isSaved = false
        }
        .onChange(of: viewModel.isSaved) { isSaved in
            if isSaved {
                dismiss()
            }
        }
        .onDisappear {
            if !showingTypeSelection && !showingParameterDetails {
                viewModelProvider.profileSetupViewModel.reset()
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                if let existingProfile {
                    viewModel.updateProfile(existingProfile, title: title, purpose: purpose, parameters: parameters)
                } else {
                    viewModel.createProfile(title: title, purpose: purpose, parameters: parameters)
                }
            } label: {
                Text(existingProfile != nil ? "Сохранить" : "Создать")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(
                        Capsule()
                            .fill(Color.accentColor)
                            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 2)
                    )
                    .foregroundColor(.white)
            }
            .disabled(title.isEmpty || purpose.isEmpty/* || parameters.isEmpty*/)
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background {
                Color.clear
            }
        }
    }
    
    private func addParameter(of type: PreferenceType) {
        switch type {
        case .boolean:
            parameters.append(.boolean(BooleanParameter(
                id: UUID().uuidString,
                title: "Новый параметр",
                value: false
            )))
        case .singleChoice:
            parameters.append(.singleChoice(SingleChoiceParameter(
                id: UUID().uuidString,
                title: "Новый параметр",
                options: ["Вариант 1", "Вариант 2"],
                selectedOption: "Вариант 1"
            )))
        case .multipleChoice:
            parameters.append(.multipleChoice(MultipleChoiceParameter(
                id: UUID().uuidString,
                title: "Новый параметр",
                options: ["Вариант 1", "Вариант 2"],
                selectedOptions: []
            )))
        case .range:
            parameters.append(.range(RangeParameter(
                id: UUID().uuidString,
                title: "Новый параметр",
                min: 1,
                max: 10,
                currentValue: 5
            )))
        case .text:
            parameters.append(.text(TextParameter(
                id: UUID().uuidString,
                title: "Новый параметр",
                value: ""
            )))
        }
    }

    private func removeParameter(at indexSet: IndexSet) {
        parameters.remove(atOffsets: indexSet)
    }
}

