//
//  GeoDBCityListProvider.swift
//  CoreGeoInfoProvider
//
//  Created by Andrey Tanakov on 24.12.2024.
//

import Foundation

public struct CityInfo: Decodable {
    public let id: Int
    public let name: String
    public let region: String?
    public let country: String
}

fileprivate struct CitiesResponse: Decodable {
    let data: [CityInfo]
}

public final class GeoDBCityListProvider {
    private let baseURL = "https://wft-geo-db.p.rapidapi.com/v1/geo/cities"
    private let apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func fetchCities(countryId: String, offset: Int, limit: Int) async throws -> [CityInfo] {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.queryItems = [
            URLQueryItem(name: "countryIds", value: countryId),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]
        let url = (urlComponents?.url)!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("wft-geo-db.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")

        let (data, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            print("Request error with response: \(response)")
            throw URLError(.badServerResponse)
        }

        let decodedResponse = try JSONDecoder().decode(CitiesResponse.self, from: data)
        return decodedResponse.data
    }
}

