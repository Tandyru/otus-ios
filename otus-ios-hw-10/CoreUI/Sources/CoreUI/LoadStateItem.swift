//
//  LoadStateItem.swift
//  CoreUI
//
//  Created by Andrey Tanakov on 02.01.2025.
//

import SwiftUI

public struct LoadStateItem: View {
    
    public enum State {
        case loading
        case loadError
    }
    
    let state: State
    let retry: () -> Void
    
    public init(state: LoadStateItem.State, retry: @escaping () -> Void) {
        self.state = state
        self.retry = retry
    }

    public var body: some View {
        VStack {
            switch state {
            case .loading:
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
            }
        }
    }
}
