//
//  CityListProvider.swift
//  otus-ios-hw-3
//
//  Created by Andrey Tanakov on 24.12.2024.
//

protocol CityListService {
    func fetch(countryId: String, offset: Int, limit: Int) async throws -> [City]
}
