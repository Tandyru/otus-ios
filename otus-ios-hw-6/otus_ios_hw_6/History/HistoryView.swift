//
//  HistoryView.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel: HistoryViewModel
    
    var body: some View {
        List(viewModel.items) { item in
            NavigationLink {
                HistoryItemDetailView(textSuffixes: viewModel.getTuffixesByDate(item.date)!)
            } label: {
                Text(item.text)
            }
        }
        .navigationTitle("History")
    }
}
