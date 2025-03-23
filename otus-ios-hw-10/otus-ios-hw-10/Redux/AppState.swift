//
//  State.swift
//  otus-ios-hw-10
//
//  Created by Andrey Tanakov on 31.12.2024.
//

enum LoadingState {
    case canLoadMore
    case loading
    case loadError
    case allLoaded
}

struct CityList {
    let country: Country
    var cities: [City]?
    var loading: LoadingState
}

struct AppState {
    var currentCountry: Country
    var countryCities: [CityList]
}

extension AppState {
    var currentCountryCityList: CityList? {
        countryCities.first { $0.country == currentCountry }
    }
}
