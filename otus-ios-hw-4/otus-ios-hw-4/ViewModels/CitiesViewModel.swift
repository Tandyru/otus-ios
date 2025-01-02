//
//  CitiesViewModel.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import Foundation
import Combine

class CitiesViewModel: ObservableObject {
    @Published var countries: [String] = []
    @Published var selectedCountry: String = ""
    @Published var countryCities: [City] = []
    @Published var loadingState: LoadingState = .canLoadMore
    
    private var subscriptions = Set<AnyCancellable>()
    private var countrySelecting = false
    
    let store: Store
    
    init(store: Store) {
        self.store = store
        store.state.sink { [weak self] state in
            self?.setState(state)
        }.store(in: &subscriptions)
        $selectedCountry.sink { [weak self] countryName in
            if !(self?.countrySelecting ?? false) {
                self?.store.dispatch(action: .setCurrentCountry(countryName))
            }
        }.store(in: &subscriptions)
    }
    
    func fetchMoreCities() {
        store.dispatch(action: .loadMoreCities)
    }
    
    func isNearLastLoaded(city: City) -> Bool {
        return countryCities.isNearLast(item: city)
    }
    
    private func setState(_ state: State) {
        countries = state.countryCities.map { $0.country.name }
        guard let cityList = state.currentCountryCityList else {
            return
        }
        countrySelecting = true
        selectedCountry = cityList.country.name
        countrySelecting = false
        countryCities = cityList.cities ?? []
        loadingState = cityList.loading
    }
}
