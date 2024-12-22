//
//  CityListProvider.swift
//  otus-ios-hw-2
//
//  Created by Andrey Tanakov on 22.12.2024.
//

import Foundation
import CitiesAPI

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

final class CityListProvider {
    private let throttle = Throttle()
    
    init() {
        CitiesAPIAPI.customHeaders = ["x-rapidapi-key": "94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6"]
//        GeoAPI.getCountriesUsingGET(namePrefix: "United") { response, error in
//            print("error: \(error)")
//            print("response: \(response)")
//        }
    }
    
    func fetch(countryId: String, offset: Int, limit: Int) async throws -> [City] {
        await throttle.wait()
        let response = try await GeoAPI.findCitiesUsingGET(countryIds: countryId, limit: limit, offset: offset)
        let cities = response.data?.map { City(name: $0.name ?? $0.city ?? "") } ?? []
        return cities
    }
}
