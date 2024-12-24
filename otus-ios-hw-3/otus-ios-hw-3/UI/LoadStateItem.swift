//
//  LoadStateItem.swift
//  otus-ios-hw-3
//
//  Created by Andrey Tanakov on 24.12.2024.
//

import SwiftUI

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
