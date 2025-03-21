//
// ForbiddenResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Forbidden Response */
public struct ForbiddenResponse: Codable, JSONEncodable, Hashable {

    public var errors: [ModelError]?

    public init(errors: [ModelError]? = nil) {
        self.errors = errors
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case errors
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(errors, forKey: .errors)
    }
}

