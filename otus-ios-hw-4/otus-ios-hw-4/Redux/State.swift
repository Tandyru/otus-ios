//
//  State.swift
//  otus-ios-hw-4
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

struct State {
    var currentCountry: Country
    var countryCities: [CityList]
}

extension State {
    var currentCountryCityList: CityList? {
        countryCities.first { $0.country == currentCountry }
    }
}
