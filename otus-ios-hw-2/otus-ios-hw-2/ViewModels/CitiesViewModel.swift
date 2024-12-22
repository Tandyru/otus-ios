//
//  CitiesViewModel.swift
//  otus-ios-hw-2
//
//  Created by Andrey Tanakov on 21.12.2024.
//

import Foundation
import CitiesAPI
//import OpenWeatherAPI

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
    
    struct City {
        let name: String
    }
     
    enum LoadingState {
        case canLoadMore
        case loading
        case loadError
        case loaded
    }
    
    struct CityList {
        let cities: [City]?
        var loading: LoadingState
    }

    typealias CountryCities = [String: CityList]
    
    @Published var selectedCountry = "Russia"
    @Published var countryCities: CountryCities = [:]
    
    init() {
        
        for country in countries {
            countryCities[country.name] = .init(cities: nil, loading: .canLoadMore)
        }
        selectedCountry = countries.first!.name

        CitiesAPIAPI.customHeaders = ["x-rapidapi-key": "94963b3682msh07639511c5fbd67p194a89jsncb95fadf69f6"]
//        GeoAPI.getCountriesUsingGET(namePrefix: "United") { response, error in
//            print("error: \(error)")
//            print("response: \(response)")
//        }
        GeoAPI.findCitiesUsingGET(countryIds: "SE", limit: 10, offset: 0) { response, error in
            print("error: \(error)")
            print("response: \(response)")
        }
//        CurrentWeatherDataAPI.currentWeatherData(lat:"33.44", lon:"-94.04", appid:  "8224cbd7ae0994b6331da300746c5a67") { model, error in
//            print("error: \(error)")
//            print("model: \(model)")
//        }
    }
    
    func fetchMoreCities() {
        guard let cityList = countryCities[selectedCountry] else {
            assertionFailure()
            return
        }
        guard cityList.loading == .canLoadMore || cityList.loading == .loadError else {
            return
        }
        let country = selectedCountry
        setLoadingState(to: .loading, for: country)
        // TODO
    }
    
    private func setLoadingState(to state: LoadingState, for country: String) {
        var countryCities = countryCities
        var cityList = countryCities[selectedCountry]
        cityList?.loading = state
        countryCities[selectedCountry] = cityList
        self.countryCities = countryCities
    }
}
