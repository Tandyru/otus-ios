//
//  Action.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

enum Action {
    case setCurrentCountry(String)
    case loadMoreCities

    case setLoading
    case onLoadingError(Country, Error)
    case addLoaded(Country, [City])
}
