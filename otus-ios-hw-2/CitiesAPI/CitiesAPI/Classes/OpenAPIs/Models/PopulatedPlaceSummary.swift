//
// PopulatedPlaceSummary.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Minimal populated-place info */
public struct PopulatedPlaceSummary: Codable, JSONEncodable, Hashable {

    /** The city name (legacy) */
    public var city: String?
    /** The country name (varies by languageCode) */
    public var country: String?
    /** The ISO-3166 country code */
    public var countryCode: String?
    /** Included if this is the result of a distance query */
    public var distance: Double?
    /** The place GeoDB native id */
    public var id: Int?
    /** The place latittude (-90.0 to 90.0) */
    public var latitude: Double?
    /** The place longitude (-180.0 to 180.0) */
    public var longitude: Double?
    /** The place name (varies by languageCode) */
    public var name: String?
    /** The place population */
    public var population: Int?
    /** The region name (varies by languageCode) */
    public var region: String?
    /** The ISO or FIPS region code */
    public var regionCode: String?
    /** The region Wikidata id */
    public var regionWdId: String?
    public var type: PopulatedPlaceType?
    /** The place WikiData id */
    public var wikiDataId: String?

    public init(city: String? = nil, country: String? = nil, countryCode: String? = nil, distance: Double? = nil, id: Int? = nil, latitude: Double? = nil, longitude: Double? = nil, name: String? = nil, population: Int? = nil, region: String? = nil, regionCode: String? = nil, regionWdId: String? = nil, type: PopulatedPlaceType? = nil, wikiDataId: String? = nil) {
        self.city = city
        self.country = country
        self.countryCode = countryCode
        self.distance = distance
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.population = population
        self.region = region
        self.regionCode = regionCode
        self.regionWdId = regionWdId
        self.type = type
        self.wikiDataId = wikiDataId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case city
        case country
        case countryCode
        case distance
        case id
        case latitude
        case longitude
        case name
        case population
        case region
        case regionCode
        case regionWdId
        case type
        case wikiDataId
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(countryCode, forKey: .countryCode)
        try container.encodeIfPresent(distance, forKey: .distance)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(latitude, forKey: .latitude)
        try container.encodeIfPresent(longitude, forKey: .longitude)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(population, forKey: .population)
        try container.encodeIfPresent(region, forKey: .region)
        try container.encodeIfPresent(regionCode, forKey: .regionCode)
        try container.encodeIfPresent(regionWdId, forKey: .regionWdId)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(wikiDataId, forKey: .wikiDataId)
    }
}
