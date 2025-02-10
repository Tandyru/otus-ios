//
//  SharedText.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//

import Combine

final class SharedText: ObservableObject {
    @Published var text: String = ""
}
