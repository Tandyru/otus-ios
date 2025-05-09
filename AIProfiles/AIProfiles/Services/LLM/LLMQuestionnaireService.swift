//
//  LLMQuestionnaireService.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

// LLMQuestionnaireService.swift
import Foundation

class LLMQuestionnaireService {
    @Inject private var llmService: LLMServiceProtocol
    
    func generateNextQuestion(profilePurpose: String, existingParams: [PreferenceParameterType]) async throws -> (question: String, paramType: PreferenceType?, [String]?) {
        let context = """
        Profile purpose: \(profilePurpose)
        Existing parameters: \(existingParams.map { $0.title }.joined(separator: ", "))
        """
        
        let prompt = """
        You are a profile builder. Generate the next question to define user preferences for: \(context)
        The building profile will be used in subsequent LLM interactions to adapt to user preferences and is not tied to any specific problem or scenario.
        Respond **ONLY** with a valid JSON in the following format: {"question": "...", "param_type": "boolean|single_choice|range|text|none"}
        Requirements:
        1. Do NOT add any explanations or text outside the JSON object
        2. If no more questions needed, set param_type to "none"
        3. Do NOT use markdown formatting or any wrappers like ```
        4. Keep the JSON syntax valid
        5. No prefixes like "Response:" or "Example:"
        Example response:
        {"question": "Do you prefer morning or evening activities?", "param_type": "single_choice", "options": ["morning", "evening"]}
        """
        
        let userMessage = LLMAPIMessage(role: "user", content: prompt)
        
        let language = Locale.interfaceLanguageCode
        let languageMessage = LLMAPIMessage(role: "system", content: "Always respond in \(Locale.current.localizedString(forLanguageCode: language) ?? "English").")
        
        let response = try await llmService.send(messages: [languageMessage, userMessage])
        
        guard let jsonString = extractJSON(from: response) else {
            throw NSError(domain: "Invalid response format", code: -1)
        }
        guard let data = jsonString.data(using: .utf8) else {
            throw NSError(domain: "Invalid response format", code: -1)
        }
        do {
            let result = try JSONDecoder().decode(QuestionResponse.self, from: data)
            return (result.question, result.paramType.asPreferenceType, result.options)
        } catch {
            print("Question response decoding error: \(error)")
            throw error
        }
    }
    
    private struct QuestionResponse: Codable {
        let question: String
        let paramType: String
        let options: [String]?
        
        enum CodingKeys: String, CodingKey {
            case question
            case paramType = "param_type"
            case options
        }
    }
}

fileprivate func extractJSON(from markdownString: String) -> String? {
    let pattern = #"(?s)```json\n(.*?)\n```\s*$"#
    guard let regex = try? NSRegularExpression(pattern: pattern) else { return markdownString }
    
    let nsString = markdownString as NSString
    guard let match = regex.firstMatch(in: markdownString, range: NSRange(location: 0, length: nsString.length)) else {
        return markdownString
    }
    
    let jsonRange = match.range(at: 1)
    return nsString.substring(with: jsonRange)
}

fileprivate extension String {
    var asPreferenceType: PreferenceType? {
        switch self {
        case "boolean":
            return .boolean
        case "single_choice":
            return .singleChoice
        case "multiple_choice":
            return .multipleChoice
        case "range":
            return .range
        case "text":
            return .text
        default:
            return nil
        }
    }
}
