//
// CountrySummary.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Minimal country info */
public struct CountrySummary: Codable, JSONEncodable, Hashable {

    /** The ISO-3166 country code */
    public var code: String?
    /** A list of supported ISO-4217 currency codes */
    public var currencyCodes: [String]?
    /** The country name (varies by languageCode) */
    public var name: String?
    /** The country WikiData id */
    public var wikiDataId: String?

    public init(code: String? = nil, currencyCodes: [String]? = nil, name: String? = nil, wikiDataId: String? = nil) {
        self.code = code
        self.currencyCodes = currencyCodes
        self.name = name
        self.wikiDataId = wikiDataId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case currencyCodes
        case name
        case wikiDataId
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(currencyCodes, forKey: .currencyCodes)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(wikiDataId, forKey: .wikiDataId)
    }
}

