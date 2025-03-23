//
//  CityListStorage.swift
//  ServiceCityListProvider
//
//  Created by Andrey Tanakov on 23.03.2025.
//

@preconcurrency import RealmSwift
import CoreGeoInfoProvider

actor CityListStorage {
    private var realm: Realm!
    init() async throws {
        realm = try await Realm(actor: self)
    }
    
    func saveCities(_ cities: [City], countryId: String) async throws {
        try await realm.asyncWrite {
            let country = realm.object(ofType: RealmCountry.self, forPrimaryKey: countryId)
                ?? RealmCountry(value: ["countryId": countryId])
            
            let existingCities = Set(country.cities.map(\.name))
            let citiesToAdd = cities.filter { !existingCities.contains($0.name) }
            
            let realmCities = citiesToAdd.map { RealmCity(value: ["name": $0.name]) }
            country.cities.append(objectsIn: realmCities)
            
            realm.add(country, update: .modified)
        }
    }
    
    func loadCities(countryId: String, offset: Int, limit: Int) async -> [City] {
        let country = try await realm.object(ofType: RealmCountry.self, forPrimaryKey: countryId)
        guard let country else {
            return []
        }
        let cities = Array(country.cities)
        let startIndex = offset
        let endIndex = min(offset + limit, cities.count)
        
        return cities[startIndex..<endIndex].map { City(name: $0.name) }
    }
}
