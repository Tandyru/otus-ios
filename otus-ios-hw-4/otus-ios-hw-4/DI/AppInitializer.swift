//
//  AppInitializer.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

final class AppInitializer {
    init() {
        let cityListProvider = CityListServiceImpl() as CityListService
        ServiceLocator.shared.register(cityListProvider)

        let countries: [Country] = [
            .init(name: "Russia", code: "RU"),
            .init(name: "USA", code: "US"),
            .init(name: "Sweden", code: "SE")
        ]
        let store = Store(initialState: .init(currentCountry: countries[0],
                                              countryCities: countries.map {
                                                  .init(country: $0, cities: nil, loading: .canLoadMore)
                                              }),
                          reducer: Reducer(),
                          middleware: LoadMoreCitiesMiddleware()
        )
        ServiceLocator.shared.register(store)
    }
}
