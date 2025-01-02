//
//  Reducer.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

final class Reducer {
    func reduce(state: State, action: Action) -> State {
        switch action {
        case let .setCurrentCountry(country):
            return state.replacingCurrentCountry(country)
        case .setLoading:
            return state.replacingLoadingState(.loading)
        case let .onLoadingError(country, _):
            return state.replacingLoadingState(.loadError, country: country)
        case let .addLoaded(country, cities):
            return state.addingLoaded(cities: cities, country: country)
        default:
            break
        }
        return state
    }
}

extension State {
    var currentCountryCityListIndex: Int {
        countryCities.firstIndex(where: { $0.country == currentCountry }) ?? 0
    }
    
    var countries: [Country] {
        countryCities.map { $0.country }
    }
    
    func replacingCurrentCountry(_ country: String) -> State {
        guard let country = countries.first(where: { $0.name == country }) else {
            return self
        }
        var state = self
        state.currentCountry = country
        return state
    }
    
    func replacingLoadingState(_ loadingState: LoadingState) -> State {
        var state = self
        let index = state.currentCountryCityListIndex
        state.countryCities[index].loading = loadingState
        return state
    }
    
    func replacingLoadingState(_ loadingState: LoadingState, country: Country) -> State {
        var state = self
        let index = countryCities.firstIndex(where: { $0.country == country }) ?? 0
        state.countryCities[index].loading = loadingState
        return state
    }
    
    func addingLoaded(cities: [City], country: Country) -> State {
        var state = self
        let index = countryCities.firstIndex(where: { $0.country == country }) ?? 0
        if cities.isEmpty {
            return replacingLoadingState(.allLoaded, country: country)
        }
        var new = (countryCities[index].cities ?? [])
        new.append(contentsOf: cities)
        new = new.reduce(into: [City]()) { result, city in
            if !result.contains(where: { $0.id == city.id } ) {
                result.append(city)
            }
        }
        state.countryCities[index].cities = new
        state.countryCities[index].loading = .canLoadMore
        return state
    }
}

