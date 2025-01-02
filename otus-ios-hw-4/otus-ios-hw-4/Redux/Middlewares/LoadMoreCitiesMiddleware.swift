//
//  LoadMoreCitiesMiddleware.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 01.01.2025.
//

import ServiceCityListProvider

final class LoadMoreCitiesMiddleware {
    @Inject var service: CityListService

    func execute(actoin: Action, state: AppState, dispatch: @escaping (Action) -> AppState?) {
        guard case .loadMoreCities = actoin else {
            return
        }
        let country = state.currentCountry
        guard let cityList = state.currentCountryCityList else {
            return
        }
        guard cityList.loading == .canLoadMore || cityList.loading == .loadError else {
            return
        }
        let state = dispatch(.setLoading)
        guard state?.currentCountryCityList?.loading == .loading else {
            return
        }
        let loadedCityCount = cityList.cities?.count ?? 0
        Task {
            do {
                let result = try await service.fetch(countryId: country.code, offset: loadedCityCount, limit: 10)
                await MainActor.run {
                    _ = dispatch(.addLoaded(country, result.map { .init(name: $0.name) }))
                }
            } catch {
                await MainActor.run {
                    _ = dispatch(.onLoadingError(country, error))
                }
            }
        }
    }
}
