//
//  Profile.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import Foundation

public struct Profile: Identifiable, Codable, Sendable {
    public let id: UUID
    public var title: String
    public var purpose: String
    public var parameters: [PreferenceParameterType]
    public let createdAt: Date
    
    public init(id: UUID, title: String, purpose: String, parameters: [PreferenceParameterType], createdAt: Date) {
        self.id = id
        self.title = title
        self.purpose = purpose
        self.parameters = parameters
        self.createdAt = createdAt
    }
}

extension Profile: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

public enum PreferenceParameterType: Codable, Equatable, Sendable {
    case boolean(BooleanParameter)
    case singleChoice(SingleChoiceParameter)
    case multipleChoice(MultipleChoiceParameter)
    case range(RangeParameter)
    case text(TextParameter)
    
    enum CodingKeys: String, CodingKey {
        case type
        case data
    }
    
    public init(from decoder: Decoder) throws {
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
    
    public func encode(to encoder: Encoder) throws {
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
    public var id: String {
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
    
    public var type: PreferenceType {
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

public protocol PreferenceParameter: Codable & Identifiable & Equatable {
    var id: String { get }
    var title: String { get }
    var type: PreferenceType { get }
}

public enum PreferenceType: String, Codable, Sendable {
    case boolean
    case singleChoice
    case multipleChoice
    case range
    case text
}

public struct BooleanParameter: PreferenceParameter, Sendable {
    public let id: String
    public var title: String
    public var type: PreferenceType = .boolean
    public var value: Bool
    public init(id: String, title: String, type: PreferenceType = .boolean, value: Bool) {
        self.id = id
        self.title = title
        self.type = type
        self.value = value
    }
}

public struct SingleChoiceParameter: PreferenceParameter, Sendable {
    public let id: String
    public var title: String
    public var type: PreferenceType = .singleChoice
    public var options: [String]
    public var selectedOption: String
    public init(id: String, title: String, type: PreferenceType = .singleChoice, options: [String], selectedOption: String) {
        self.id = id
        self.title = title
        self.type = type
        self.options = options
        self.selectedOption = selectedOption
    }
}

public struct MultipleChoiceParameter: PreferenceParameter, Sendable {
    public let id: String
    public var title: String
    public var type: PreferenceType = .multipleChoice
    public var options: [String]
    public var selectedOptions: [String]
    public init(id: String, title: String, type: PreferenceType = .multipleChoice, options: [String], selectedOptions: [String]) {
        self.id = id
        self.title = title
        self.type = type
        self.options = options
        self.selectedOptions = selectedOptions
    }
}

public struct RangeParameter: PreferenceParameter, Sendable {
    public let id: String
    public var title: String
    public var type: PreferenceType = .range
    public var min: Int
    public var max: Int
    public var currentValue: Int
    public init(id: String, title: String, type: PreferenceType = .range, min: Int, max: Int, currentValue: Int) {
        self.id = id
        self.title = title
        self.type = type
        self.min = min
        self.max = max
        self.currentValue = currentValue
    }
}

public struct TextParameter: PreferenceParameter, Sendable {
    public let id: String
    public var title: String
    public var type: PreferenceType = .text
    public var value: String
    public init(id: String, title: String, type: PreferenceType = .text, value: String) {
        self.id = id
        self.title = title
        self.type = type
        self.value = value
    }
}

public extension Profile {
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
