//
//  ProfileListView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI
import CoreProfile
import CoreRouting
import FeatureChat
import FeatureProfileSetup

public struct ProfileListView: View {
    @StateObject private var viewModel: ProfileListViewModel
    @EnvironmentObject private var router: Router
    @State private var showErrorAlert = false
    @State private var selectedProfile: Profile? = nil
    @State private var selectedChatProfile: Profile? = nil

    public init(viewModel: ProfileListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding(.horizontal)
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.profiles, id: \.id) { profile in
                        ProfileCell(profile: profile, onProfileTapped: {
                            selectedProfile = profile
                        }, onChatTapped: {
                            selectedChatProfile = profile
                        })
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                viewModel.deleteProfile(profile)
                            } label: {
                                Label("Удалить", systemImage: "trash")
                            }
                        }
                    }
                }
                .navigationTitle("Мои профили")
                .navigationDestination(item: $selectedProfile) { profile in
                    ProfileSetupView(existingProfile: profile)
                }
                .navigationDestination(item: $selectedChatProfile) { profile in
                    ChatView(profile: profile)
                }
            }
        }
        .background(Color(.systemGroupedBackground))
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("Ошибка"),
                message: Text(viewModel.error ?? "Неизвестная ошибка"),
                dismissButton: .default(Text("OK"))
            )
        }
        .safeAreaInset(edge: .bottom) {
            // Empty spacer to ensure the FAB doesn't overlap content
            Spacer().frame(height: 80)
        }
        .overlay(
            NavigationLink(destination: ProfileSetupView()) {
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color.blue))
                    .shadow(radius: 4)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        )
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    router.push(
                        .settings
                    )
                } label: {
                    Image(systemName: "gearshape")
                }
            }
        }
        .onAppear {
            viewModel.fetchProfiles()
        }
        .onChange(of: viewModel.error) { _, error in
            if error != nil {
                showErrorAlert = true
            }
        }
    }
}
