//
//  CitiesView.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import SwiftUI
import CoreUI

struct CitiesView: View {
    @StateObject var viewModel: CitiesViewModel

    init(viewModel: CitiesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.font: UIFont.systemFont(ofSize: 18)],
            for: .normal
        )
    }

    var body: some View {
        NavigationView {
            GeometryReader { _ in
                VStack {
                    Picker("Countries", selection: $viewModel.selectedCountry) {
                        ForEach(viewModel.countries, id: \.self) { name in
                            Text (name).tag(name)
                        }
                    }.pickerStyle(.segmented)
                    List {
                        ForEach(viewModel.countryCities) { city in
                            Text(city.name)
                                .onAppear {
                                    if viewModel.isNearLastLoaded(city: city) {
                                        viewModel.fetchMoreCities()
                                    }
                                }
                        }
                        if let state = viewModel.loadingState.asLoadStateItemState {
                            LoadStateItem(state: state, retry: viewModel.fetchMoreCities)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .onAppear {
                        viewModel.fetchMoreCities()
                    }
                }.onChange(of: viewModel.selectedCountry) {
                    viewModel.fetchMoreCities()
                }
            }
            .padding()
            .navigationTitle("Cities")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

extension LoadingState {
    var asLoadStateItemState: LoadStateItem.State? {
        switch self {
        case .canLoadMore, .loading:
            return .loading
        case .loadError:
            return .loadError
        case .allLoaded:
            return nil
        }
    }
}
