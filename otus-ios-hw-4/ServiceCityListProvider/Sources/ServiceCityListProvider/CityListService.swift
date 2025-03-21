//
//  CityListService.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

public struct City {
    public let name: String
}

public protocol CityListService {
    func fetch(countryId: String, offset: Int, limit: Int) async throws -> [City]
}
