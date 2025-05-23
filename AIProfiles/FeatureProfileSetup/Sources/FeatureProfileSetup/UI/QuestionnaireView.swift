//
//  QuestionnaireView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

import SwiftUI

struct QuestionnaireView: View {
    @ObservedObject var viewModel: ProfileQuestionnaireViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedOption: String = ""
    @State private var selectedOptions: [String] = []
    @State private var booleanAnswer: Bool = false
    @State private var showErrorAlert = false
    
    private let choiceItemSpacing: CGFloat = 20
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                } else if let question = viewModel.currentQuestion {
                    Text(question)
                        .font(.title2)
                        .padding()
                    
                    if viewModel.currentParamType == .singleChoice,
                       let options = viewModel.currentParamOptions,
                       !options.isEmpty
                    {
                        VStack(alignment: .leading, spacing: choiceItemSpacing) {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    if selectedOption == option {
                                        selectedOption = ""
                                    } else {
                                        selectedOption = option
                                    }
                                }) {
                                    HStack {
                                        Text(option)
                                        Spacer()
                                        if selectedOption == option {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        }
                        .onChange(of: selectedOption) {
                            viewModel.answer = selectedOption
                        }
                        .padding()
                    } else if viewModel.currentParamType == .multipleChoice,
                        let options = viewModel.currentParamOptions,
                        !options.isEmpty
                    {
                        VStack(alignment: .leading, spacing: choiceItemSpacing) {
                            ForEach(options, id: \.self) { option in
                                MultipleSelectionRow(
                                    title: option,
                                    isSelected: selectedOptions.contains(option)
                                ) {
                                    if selectedOptions.contains(option) {
                                        selectedOptions.removeAll { $0 == option }
                                    } else {
                                        selectedOptions.append(option)
                                    }
                                }
                            }
                        }
                        .onChange(of: selectedOptions) {
                            viewModel.answer = selectedOptions.joined(separator: ", ")
                        }
                        .padding()
                    } else if viewModel.currentParamType == .boolean {
                        Toggle("Да/Нет", isOn: $booleanAnswer)
                            .onChange(of: booleanAnswer) {
                                viewModel.answer = booleanAnswer ? "Yes" : "No"
                            }
                            .padding()
                    } else {
                        TextField("Your answer", text: $viewModel.answer)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    HStack(spacing: 20) {
                        Button("Пропустить") {
                            viewModel.skipQuestion()
                        }
                        .buttonStyle(.bordered)
                        .tint(.secondary)
                        //.foregroundColor(.secondary)
                        
                        Button("Следующий") {
                            viewModel.submitAnswer()
                        }
                        .disabled(viewModel.answer.isEmpty)
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Spacer().frame(height: 60)
                    if viewModel.canFinishEarly {
                        Button("Завершить опрос") {
                            viewModel.finishEarly()
                            dismiss()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    Text("Profile setup complete!")
                    Button("Finish") {
                        dismiss()
                    }
                }
            }
            .navigationTitle("Настройка профиля")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.startQuestionnaire()
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("Ошибка"),
                    message: Text(viewModel.errorMessage ?? "Error"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .onChange(of: viewModel.errorMessage) { _, newError in
                if newError != nil {
                    showErrorAlert = true
                }
            }
        }
    }
}

fileprivate struct MultipleSelectionRow: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
