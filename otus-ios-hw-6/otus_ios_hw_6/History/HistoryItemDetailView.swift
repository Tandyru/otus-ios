//
//  TextSuffixesView.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

import SwiftUI

struct HistoryItemDetailView: View {
    
    let textSuffixes: TextSuffixes
    
    var body: some View {
        Text(textSuffixes.text)
            .padding()
        let sortedSuffixes = textSuffixes.suffixes.sorted { $0.suffix < $1.suffix }
        List(sortedSuffixes, id: \.self) { item in
            let text = item.count > 1 ? "\(item.suffix) - \(item.count)" : item.suffix
            Text(text)
        }
    }
}
