//
// Currency.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Currency info */
public struct Currency: Codable, JSONEncodable, Hashable {

    /** The ISO-4217 currency code */
    public var code: String?
    /** A list of ISO-3166 country codes of countries supporting this currency */
    public var countryCodes: [String]?
    /** The currency symbol */
    public var symbol: String?

    public init(code: String? = nil, countryCodes: [String]? = nil, symbol: String? = nil) {
        self.code = code
        self.countryCodes = countryCodes
        self.symbol = symbol
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case countryCodes
        case symbol
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(countryCodes, forKey: .countryCodes)
        try container.encodeIfPresent(symbol, forKey: .symbol)
    }
}

