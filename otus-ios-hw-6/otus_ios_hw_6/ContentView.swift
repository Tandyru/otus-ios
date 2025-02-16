//
//  ContentView.swift
//  otus-ios-hw-5
//
//  Created by Andrey Tanakov on 25.01.2025.
//

import Combine
import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            SuffixesView(viewModel: SuffixesViewModel())
                .tabItem {
                    Label("Suffixes", systemImage: "text.append")
                }
            NavigationStack {
                HistoryView(viewModel: HistoryViewModel())
            }
                .tabItem {
                    Label("History", systemImage: "clock.fill")
                }
//            JobQueueSummaryView()
//                .tabItem {
//                    Label("Job Queue", systemImage: "list.bullet")
//                }
        }
    }
}
