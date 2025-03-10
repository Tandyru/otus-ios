//
// RegionDetails.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Full country region details */
public struct RegionDetails: Codable, JSONEncodable, Hashable {

    /** The region's capital city (varies by languageCode) */
    public var capital: String?
    /** An ISO-3166 country code */
    public var countryCode: String?
    /** The FIPS 10-4 region code */
    public var fipsCode: String?
    /** The ISO region code */
    public var isoCode: String?
    /** The region name (varies by languageCode) */
    public var name: String?
    /** The number of cities in this region */
    public var numCities: Int?
    /** The region WikiData id */
    public var wikiDataId: String?

    public init(capital: String? = nil, countryCode: String? = nil, fipsCode: String? = nil, isoCode: String? = nil, name: String? = nil, numCities: Int? = nil, wikiDataId: String? = nil) {
        self.capital = capital
        self.countryCode = countryCode
        self.fipsCode = fipsCode
        self.isoCode = isoCode
        self.name = name
        self.numCities = numCities
        self.wikiDataId = wikiDataId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case capital
        case countryCode
        case fipsCode
        case isoCode
        case name
        case numCities
        case wikiDataId
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(capital, forKey: .capital)
        try container.encodeIfPresent(countryCode, forKey: .countryCode)
        try container.encodeIfPresent(fipsCode, forKey: .fipsCode)
        try container.encodeIfPresent(isoCode, forKey: .isoCode)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(numCities, forKey: .numCities)
        try container.encodeIfPresent(wikiDataId, forKey: .wikiDataId)
    }
}

