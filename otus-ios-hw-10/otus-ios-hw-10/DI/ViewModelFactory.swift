//
//  ViewModelFactory.swift
//  otus-ios-hw-10
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import CoreRedux

final class ViewModelFactory {
    @Inject var store: AppStore
    
    func makeCitiesViewModel() -> CitiesViewModel {
        CitiesViewModel(store: store)
    }
}
