//
//  ViewModelFactory.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

final class ViewModelFactory {
    @Inject var store: Store
    
    func makeCitiesViewModel() -> CitiesViewModel {
        CitiesViewModel(store: store)
    }
}
