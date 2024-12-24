//
//  AppInitializer.swift
//  otus-ios-hw-3
//
//  Created by Andrey Tanakov on 24.12.2024.
//

final class AppInitializer {
    init() {
        let cityListProvider = CityListServiceImpl() as CityListService
        ServiceLocator.shared.register(cityListProvider)
    }
}
