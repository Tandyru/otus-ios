//
//  ProfileListView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI
import CoreProfile
import FeatureChat
import FeatureProfileSetup
import FeatureSettings

public struct ProfileListView: View {
    @StateObject private var viewModel: ProfileListViewModel
    @State private var showErrorAlert = false
    @State private var selectedProfile: Profile? = nil
    @State private var selectedChatProfile: Profile? = nil
    @State private var selectedSettings = false
    @Environment(\.profileSetupViewModelProvider) var profileSetupViewModelProvider: FeatureProfileSetup.ViewModelProvider

    public init(viewModel: ProfileListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack {
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
                        ProfileSetupView(viewModelProvider: profileSetupViewModelProvider, existingProfile: profile)
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
                NavigationLink(destination: ProfileSetupView(viewModelProvider: profileSetupViewModelProvider)) {
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
                        selectedSettings = true
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
            }
            .navigationDestination(isPresented: $selectedSettings) {
                SettingsView()
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
