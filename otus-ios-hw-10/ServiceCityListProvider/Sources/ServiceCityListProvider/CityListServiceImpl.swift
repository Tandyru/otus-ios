//
//  CityListServiceImpl.swift
//  ServiceCityListProvider
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import Foundation
import RealmSwift
import CoreGeoInfoProvider

final class CityListServiceImpl {
    private let throttle = Throttle()
    private let goeDBApiKey = "94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6"
    private let networkMonitor = NetworkMonitor()
}

extension CityListServiceImpl: CityListService {
    func fetch(countryId: String, offset: Int, limit: Int) async throws -> [City] {
        let storage = try await CityListStorage()
        
        let cachedCities = await storage.loadCities(countryId: countryId, offset: offset, limit: limit)
        if cachedCities.count == limit {
            return cachedCities
        }

        let isConnected = await networkMonitor.checkConnection()
        if isConnected {
            await throttle.wait()
            let provider = GeoDBCityListProvider(apiKey: goeDBApiKey)
            let cities = try await provider.fetchCities(countryId: countryId, offset: offset, limit: limit)
            
            try? await storage.saveCities(cities.map { .init(name: $0.name) },
                                          countryId: countryId)
            return cities.map { City(name: $0.name) }
        } else {
            return await storage.loadCities(countryId: countryId, offset: offset, limit: limit)
        }
    }
}

fileprivate actor Throttle {
    private var lastRequestDate: Date?
    private let throttleInterval: TimeInterval = 2 // in seconds

    func wait() async {
        let now = Date()

        if let lastDate = lastRequestDate, now.timeIntervalSince(lastDate) < throttleInterval {
            let delay = throttleInterval - now.timeIntervalSince(lastDate)
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        }

        lastRequestDate = Date()
    }
}
