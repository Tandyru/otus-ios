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
    @State private var debounceTask: Task<Void, Never>?
    @State private var isChatting = false
    private let viewModelProvider: ViewModelProvider
    private let debounceDuration: UInt64 = 500_000_000 // 0.5 секунды
    private var isChattingAvailable: Bool {
        viewModel.profile != nil
    }

    init(viewModelProvider: ViewModelProvider, existingProfile: Profile? = nil) {
        self.viewModelProvider = viewModelProvider
        _viewModel = StateObject(wrappedValue: viewModelProvider.profileSetupViewModel(profile: existingProfile))
        _title = State(initialValue: existingProfile?.title ?? "")
        _purpose = State(initialValue: existingProfile?.purpose ?? "")
        _parameters = State(initialValue: existingProfile?.parameters ?? [])
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Название профиля", text: $title)
                    .font(.title)
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
                        Text("Цель профиля")
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 12)
                            .allowsHitTesting(false)
                    }
                }
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
                .onChange(of: questionnaireViewModel) { _, newValue in
                    if newValue != nil {
                        showingQuestionnaire = true
                    }
                }
            }
            if viewModel.profile != nil {
                Section {
                    Button("Удалить профиль", role: .destructive) {
                        viewModel.deleteProfile()
                        dismiss()
                    }
                }
            }
        }
        .padding(.top, -30)
        .sheet(isPresented: $showingTypeSelection) {
            ParameterTypePicker(selectedType: $selectedType)
        }
        .sheet(isPresented: $showingQuestionnaire, onDismiss: {
            if let viewModel = questionnaireViewModel, viewModel.isCompleted {
                let existingIDs = Set(parameters.map { $0.id })
                let newParams = viewModel.parameters.filter { !existingIDs.contains($0.id) }
                parameters.append(contentsOf: newParams)
            }
            questionnaireViewModel = nil
        }) {
            if let viewModel = questionnaireViewModel {
                QuestionnaireView(viewModel: viewModel)
            }
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
        .onChange(of: selectedType) { _, newType in
            if let type = newType {
                addParameter(of: type)
                selectedType = nil
                showingTypeSelection = false
            }
        }
        .onDisappear {
            if !showingTypeSelection && !showingParameterDetails && !isChatting {
                viewModelProvider.resetProfileSetupViewModel()
            }
        }
        .onChange(of: title) {
            triggerAutoSave()
        }
        .onChange(of: purpose) {
            triggerAutoSave()
        }
        .onChange(of: parameters) {
            triggerAutoSave()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if isChattingAvailable {
                    Button {
                        isChatting = true
                    } label: {
                        Image(systemName: "message")
                            .symbolRenderingMode(.monochrome)
                    }
                }
            }
        }
        .navigationDestination(isPresented: $isChatting) {
            if let profile = viewModel.profile {
                ChatView(profile: profile)
            }
        }
        .safeAreaInset(edge: .bottom) {
            aiButton
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background {
                Color.clear
            }
        }
    }
    
    var aiButton: some View {
        Button {
            questionnaireViewModel = ProfileQuestionnaireViewModel(purpose: purpose)
        } label: {
            Image("AIIcon")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(12)
                .background(
                    Circle()
                        .fill(Color.accentColor)
                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 2)
                )
                .foregroundColor(.white)
        }
        .disabled(title.isEmpty || purpose.isEmpty)
        .padding()
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
        selectedParameterIndex = parameters.count - 1
        showingParameterDetails = true
    }

    private func removeParameter(at indexSet: IndexSet) {
        parameters.remove(atOffsets: indexSet)
    }
    
    private func triggerAutoSave() {
        debounceTask?.cancel()
        debounceTask = Task {
            try? await Task.sleep(nanoseconds: debounceDuration)
            await MainActor.run {
                saveProfile()
            }
        }
    }
    
    private func saveProfile() {
        guard !title.isEmpty && !purpose.isEmpty else {
            viewModel.deleteProfile()
            return
        }
        viewModel.saveProfile(title: title, purpose: purpose, parameters: parameters)
    }
}
