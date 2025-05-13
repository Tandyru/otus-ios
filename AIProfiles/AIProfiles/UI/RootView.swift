//
//  RootView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import SwiftUI
import FeatureChat
import FeatureProfileList

struct RootView: View {
    var body: some View {
        RouterView {
            ProfileListView(viewModel: ProfileListViewModel())
        }
    }
}
