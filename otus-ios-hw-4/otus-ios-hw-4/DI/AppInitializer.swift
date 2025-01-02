//
//  AppInitializer.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import ServiceCityListProvider

final class AppInitializer {
    init() {
        let cityListProvider = makeCityListService()
        ServiceLocator.shared.register(cityListProvider)

        let countries: [Country] = [
            .init(name: "Russia", code: "RU"),
            .init(name: "USA", code: "US"),
            .init(name: "Sweden", code: "SE")
        ]
        let store = AppStore(initialState: .init(currentCountry: countries[0],
                                              countryCities: countries.map {
                                                  .init(country: $0, cities: nil, loading: .canLoadMore)
                                              }),
                          reducer: AppReducer().reduce(state:action:),
                          middleware: LoadMoreCitiesMiddleware().execute(actoin:state:dispatch:)
        )
        ServiceLocator.shared.register(store)
    }
}
