//
//  ParameterDetailView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import SwiftUI
import CoreProfile

struct ParameterDetailView: View {
    @Binding var parameter: PreferenceParameterType
    let onDelete: () -> Void
    
    var body: some View {
        Form {
            switch parameter {
            case .boolean(let param):
                BooleanParameterView(parameter: param) { updatedParam in
                    parameter = .boolean(updatedParam)
                }
            case .singleChoice(let param):
                SingleChoiceParameterView(parameter: param) { updatedParam in
                    parameter = .singleChoice(updatedParam)
                }
            case .multipleChoice(let param):
                MultipleChoiceParameterView(parameter: param) { updatedParam in
                    parameter = .multipleChoice(updatedParam)
                }
            case .range(let param):
                RangeParameterView(parameter: param) { updatedParam in
                    parameter = .range(updatedParam)
                }
            case .text(let param):
                TextParameterView(parameter: param) { updatedParam in
                    parameter = .text(updatedParam)
                }
            }
            
            Section {
                Button(role: .destructive, action: onDelete) {
                    Label("Удалить параметр", systemImage: "trash")
                }
            }
        }
        .navigationTitle("Редактирование")
    }
}

struct BooleanParameterView: View {
    @State private var parameter: BooleanParameter
    private let onUpdate: (BooleanParameter) -> Void
    
    init(parameter: BooleanParameter, onUpdate: @escaping (BooleanParameter) -> Void) {
        _parameter = State(initialValue: parameter)
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        Section {
            TextField("Название", text: $parameter.title)
            Toggle("Значение", isOn: $parameter.value)
        }
        .onChange(of: parameter) { _, newValue in
            onUpdate(newValue)
        }
    }
}

struct SingleChoiceParameterView: View {
    @State private var parameter: SingleChoiceParameter
    private let onUpdate: (SingleChoiceParameter) -> Void
    
    init(parameter: SingleChoiceParameter, onUpdate: @escaping (SingleChoiceParameter) -> Void) {
        _parameter = State(initialValue: parameter)
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        Section {
            TextField("Название", text: $parameter.title)
            TextField("Варианты (через запятую)", text: $parameter.optionsCSV)
                .onChange(of: parameter.optionsCSV) { _, newValue in
                    parameter.options = newValue.components(separatedBy: ",")
                        .map { $0.trimmingCharacters(in: .whitespaces) }
                }
            Picker("Выбранный вариант:", selection: $parameter.selectedOption) {
                ForEach(parameter.options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
        }
        .onChange(of: parameter) { _, newValue in
            onUpdate(newValue)
        }
    }
}

struct MultipleChoiceParameterView: View {
    @State private var parameter: MultipleChoiceParameter
    private let onUpdate: (MultipleChoiceParameter) -> Void
    
    init(parameter: MultipleChoiceParameter, onUpdate: @escaping (MultipleChoiceParameter) -> Void) {
        _parameter = State(initialValue: parameter)
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        Section {
            TextField("Название", text: $parameter.title)
            TextField("Варианты (через запятую)", text: $parameter.optionsCSV)
                .onChange(of: parameter.optionsCSV) { _, newValue in
                    parameter.options = newValue.components(separatedBy: ",")
                        .map { $0.trimmingCharacters(in: .whitespaces) }
                }
            ForEach(parameter.options, id: \.self) { option in
                MultipleSelectionRow(
                    title: option,
                    isSelected: parameter.selectedOptions.contains(option)
                ) {
                    if parameter.selectedOptions.contains(option) {
                        parameter.selectedOptions.removeAll { $0 == option }
                    } else {
                        parameter.selectedOptions.append(option)
                    }
                }
            }
        }
        .onChange(of: parameter) { _, newValue in
            onUpdate(newValue)
        }
    }
}

struct RangeParameterView: View {
    @State private var parameter: RangeParameter
    private let onUpdate: (RangeParameter) -> Void

    init(parameter: RangeParameter, onUpdate: @escaping (RangeParameter) -> Void) {
        _parameter = State(initialValue: parameter)
        self.onUpdate = onUpdate
    }

    var body: some View {
        Section {
            TextField("Название", text: $parameter.title)
            Stepper("Мин: \(parameter.min)", value: $parameter.min, in: 0...parameter.max)
            Stepper("Макс: \(parameter.max)", value: $parameter.max, in: parameter.min...100)
            Slider(value: Binding<Double>(
                get: { Double(parameter.currentValue) },
                set: { parameter.currentValue = Int($0.rounded()) }
            ),
            in: Double(parameter.min)...Double(parameter.max),
            step: 1.0)
                .onChange(of: parameter.currentValue) { _, newValue in
                    parameter.currentValue = Int(newValue)
                }
        }
        .onChange(of: parameter) { _, newValue in
            onUpdate(newValue)
        }
    }
}

struct TextParameterView: View {
    @State private var parameter: TextParameter
    private let onUpdate: (TextParameter) -> Void
    
    init(parameter: TextParameter, onUpdate: @escaping (TextParameter) -> Void) {
        _parameter = State(initialValue: parameter)
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        Section {
            TextField("Название", text: $parameter.title)
            TextEditor(text: $parameter.value)
                .frame(height: 100)
        }
        .onChange(of: parameter) { _, newValue in
            onUpdate(newValue)
        }
    }
}

extension SingleChoiceParameter {
    var optionsCSV: String {
        get { options.joined(separator: ", ") }
        set { options = newValue.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) } }
    }
}

extension MultipleChoiceParameter {
    var optionsCSV: String {
        get { options.joined(separator: ", ") }
        set { options = newValue.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) } }
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
