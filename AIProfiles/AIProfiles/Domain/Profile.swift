//
//  Profile.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import Foundation

struct Profile: Identifiable, Codable {
    let id: UUID
    var title: String
    var purpose: String
    var parameters: [PreferenceParameterType]
    let createdAt: Date
}

extension Profile: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum PreferenceParameterType: Codable, Equatable {
    case boolean(BooleanParameter)
    case singleChoice(SingleChoiceParameter)
    case multipleChoice(MultipleChoiceParameter)
    case range(RangeParameter)
    case text(TextParameter)
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(PreferenceType.self, forKey: .type)
        let data = try container.decode(Data.self, forKey: .data)
        
        switch type {
        case .boolean:
            self = .boolean(try JSONDecoder().decode(BooleanParameter.self, from: data))
        case .singleChoice:
            self = .singleChoice(try JSONDecoder().decode(SingleChoiceParameter.self, from: data))
        case .multipleChoice:
            self = .multipleChoice(try JSONDecoder().decode(MultipleChoiceParameter.self, from: data))
        case .range:
            self = .range(try JSONDecoder().decode(RangeParameter.self, from: data))
        case .text:
            self = .text(try JSONDecoder().decode(TextParameter.self, from: data))
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let data: Data
        
        switch self {
        case .boolean(let param):
            try container.encode(PreferenceType.boolean, forKey: .type)
            data = try JSONEncoder().encode(param)
        case .singleChoice(let param):
            try container.encode(PreferenceType.singleChoice, forKey: .type)
            data = try JSONEncoder().encode(param)
        case .multipleChoice(let param):
            try container.encode(PreferenceType.multipleChoice, forKey: .type)
            data = try JSONEncoder().encode(param)
        case .range(let param):
            try container.encode(PreferenceType.range, forKey: .type)
            data = try JSONEncoder().encode(param)
        case .text(let param):
            try container.encode(PreferenceType.text, forKey: .type)
            data = try JSONEncoder().encode(param)
        }
        
        try container.encode(data, forKey: .data)
    }
}

extension PreferenceParameterType {
    var id: String {
        switch self {
        case .boolean(let parameter):
            return parameter.id
        case .singleChoice(let parameter):
            return parameter.id
        case .multipleChoice(let parameter):
            return parameter.id
        case .range(let parameter):
            return parameter.id
        case .text(let parameter):
            return parameter.id
        }
    }
    
    var type: PreferenceType {
        switch self {
        case .boolean(let parameter):
            return parameter.type
        case .singleChoice(let parameter):
            return parameter.type
        case .multipleChoice(let parameter):
            return parameter.type
        case .range(let parameter):
            return parameter.type
        case .text(let parameter):
            return parameter.type
        }
    }
}

protocol PreferenceParameter: Codable & Identifiable & Equatable {
    var id: String { get }
    var title: String { get }
    var type: PreferenceType { get }
}

enum PreferenceType: String, Codable {
    case boolean
    case singleChoice
    case multipleChoice
    case range
    case text
}

struct BooleanParameter: PreferenceParameter {
    let id: String
    var title: String
    var type: PreferenceType = .boolean
    var value: Bool
}

struct SingleChoiceParameter: PreferenceParameter {
    let id: String
    var title: String
    var type: PreferenceType = .singleChoice
    var options: [String]
    var selectedOption: String
}

struct MultipleChoiceParameter: PreferenceParameter {
    let id: String
    var title: String
    var type: PreferenceType = .multipleChoice
    var options: [String]
    var selectedOptions: [String]
}

struct RangeParameter: PreferenceParameter {
    let id: String
    var title: String
    var type: PreferenceType = .range
    var min: Int
    var max: Int
    var currentValue: Int
}

struct TextParameter: PreferenceParameter {
    let id: String
    var title: String
    var type: PreferenceType = .text
    var value: String
}

extension Profile {
    func parameter<T>(ofType type: T.Type, withID id: String) -> T? where T: PreferenceParameter {
        parameters.compactMap {
            switch $0 {
            case .boolean(let param as T): return param.id == id ? param : nil
            case .singleChoice(let param as T): return param.id == id ? param : nil
            case .multipleChoice(let param as T): return param.id == id ? param : nil
            case .range(let param as T): return param.id == id ? param : nil
            case .text(let param as T): return param.id == id ? param : nil
            default: return nil
            }
        }.first
    }
}
