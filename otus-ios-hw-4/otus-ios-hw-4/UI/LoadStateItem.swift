//
//  LoadStateItem.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import SwiftUI

struct LoadStateItem: View {
    let state: LoadingState
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
            case .allLoaded:
                Spacer().frame(height: 1)
            }
        }
    }
}
