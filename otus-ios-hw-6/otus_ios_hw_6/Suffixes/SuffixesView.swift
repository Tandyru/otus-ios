//
//  SuffixesView.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//

import SwiftUI

struct SuffixesView: View {
    
    @StateObject var viewModel: SuffixesViewModel

    let tabs = ["all", "top"]
    @State private var selectedTab: String = "all"
    
    var body: some View {
        VStack {
            TextEditor(text: $viewModel.text)
                .frame(height: 200)
                .border(Color.gray, width: 1)
                .padding()
            Picker("", selection: $selectedTab) {
                Text("List").tag(tabs[0])
                Text("Top-10").tag(tabs[1])
            }.pickerStyle(.segmented)
                .padding(.horizontal)
            if selectedTab == tabs[0] {
                HStack {
                    Picker("", selection: $viewModel.sortBy) {
                        Text("ASC").tag(SuffixesViewModel.SortBy.asc)
                        Text("DESC").tag(SuffixesViewModel.SortBy.desc)
                    }.pickerStyle(.segmented)
                        .frame(width: 100)
                    Spacer()
                }
                .padding(.horizontal)
                TextField("", text: $viewModel.searchString)
                                .padding()
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                if let suffixes = viewModel.lexSortedSuffixes {
                    List(suffixes) {
                        let text = $0.count > 1 ? "\($0.suffix) - \($0.count)" : $0.suffix
                        Text(text)
                    }
                }
            } else {
                if let suffixes = viewModel.top10Suffixes {
                    List(suffixes) {
                        let text = $0.count > 1 ? "\($0.suffix) - \($0.count)" : $0.suffix
                        Text(text)
                    }
                }
            }
        }
    }
}

#Preview {
    SuffixesView(viewModel: SuffixesViewModel())
}
