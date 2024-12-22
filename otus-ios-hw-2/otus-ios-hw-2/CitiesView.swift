//
//  CitiesView.swift
//  otus-ios-hw-2
//
//  Created by Andrey Tanakov on 21.12.2024.
//

import SwiftUI

struct CitiesView: View {
    @StateObject var viewModel = CitiesViewModel()

    init() {
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
                        ForEach(viewModel.countryNames, id: \.self) { name in
                            Text (name).tag(name)
                        }
                    }.pickerStyle(.segmented)
                    if let cities = viewModel.countryCities[viewModel.selectedCountry] {
                        List {
                            if let cities = cities.cities {
                                ForEach(cities) { city in
                                    Text(city.name)
                                        .onAppear {
                                            if viewModel.isNearLastLoaded(city: city) {
                                                viewModel.fetchMoreCities()
                                            }
                                        }
                                }
                            }
                            LoadStateItem(state: cities.loading, retry: viewModel.fetchMoreCities)
                        }
                        .scrollContentBackground(.hidden)
                        .onAppear {
                            viewModel.fetchMoreCities()
                        }
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

struct LoadStateItem: View {
    let state: CitiesViewModel.LoadingState
    let retry: () -> Void
    
    var body: some View {
        VStack {
            switch state {
            case .canLoadMore, .loading:
                HStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.2)
                    Spacer()
                }
            case .loadError:
                HStack(spacing: 20) {
                    Spacer()
                    Text("Error")
                    Button {
                        retry()
                    } label: {
                        Text("Retry")
                    }.buttonStyle(.bordered)
                    Spacer()
                }
            case .loaded:
                Spacer().frame(height: 1)
            }
        }
    }
}


#Preview {
    CitiesView()
}
