//
//  CitiesViewModel.swift
//  otus-ios-hw-3
//
//  Created by Andrey Tanakov on 24.12.2024.
//

import Foundation

class CitiesViewModel: ObservableObject {

    struct Country {
        let name: String
        let code: String
    }
    
    let countries: [Country] = [
        .init(name: "Russia", code: "RU"),
        .init(name: "USA", code: "US"),
        .init(name: "Sweden", code: "SE")
    ]
    
    var countryNames: [String] {
        countries.map { $0.name }
    }
         
    enum LoadingState {
        case canLoadMore
        case loading
        case loadError
        case loaded
    }
    
    struct CityList {
        var cities: [City]?
        var loading: LoadingState
    }

    typealias CountryCities = [String: CityList]
    
    @Inject var cityListProvider: CityListService
    
    @Published var selectedCountry = "Russia"
    @Published var countryCities: CountryCities = [:]
    
    init() {
        
        for country in countries {
            countryCities[country.name] = .init(cities: nil, loading: .canLoadMore)
        }
        selectedCountry = countries.first!.name
    }
    
    func fetchMoreCities() {
        guard let cityList = countryCities[selectedCountry] else {
            assertionFailure()
            return
        }
        guard cityList.loading == .canLoadMore || cityList.loading == .loadError else {
            return
        }
        let loadedCount = cityList.cities?.count ?? 0
        let country = selectedCountry
        setLoadingState(to: .loading, for: country)
        Task { @MainActor [country] in
            do {
                let countryId = self.getCountryCode(for: country)
                let cities = try await cityListProvider.fetch(countryId: countryId, offset: loadedCount, limit: 10)
                self.appendLoaded(cities: cities, for: country, newLoadingState: cities.count == 0 ? .loaded : .canLoadMore)
            } catch {
                print("load error: \(error)")
                self.setLoadingState(to: .loadError, for: country)
            }
        }
    }
    
    func isNearLastLoaded(city: City) -> Bool {
        guard let cityList = countryCities[selectedCountry] else {
            assertionFailure()
            return false
        }
        guard let cities = cityList.cities else {
            assertionFailure()
            return false
        }
        return cities.isNearLast(item: city)
    }
    
    private func setLoadingState(to state: LoadingState, for country: String) {
        var cityList = countryCities[selectedCountry]
        cityList?.loading = state
        countryCities[selectedCountry] = cityList
    }
    
    private func appendLoaded(cities: [City], for country: String, newLoadingState: LoadingState) {
        var cityList = countryCities[selectedCountry]
        var new = (cityList?.cities ?? [])
        new.append(contentsOf: cities)
        new = new.reduce(into: [City]()) { result, city in
            if !result.contains(where: { $0.id == city.id } ) {
                result.append(city)
            }
        }
        cityList?.cities = new
        cityList?.loading = newLoadingState
        countryCities[selectedCountry] = cityList
    }
    
    private func getCountryCode(for country: String) -> String {
        countries.first(where: { $0.name == country })?.code ?? ""
    }
}

