//
//  ProfileListView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI

struct ProfileListView: View {
    @StateObject private var viewModel: ProfileListViewModel
    @State private var showErrorAlert = false
    @State private var selectedProfile: Profile? = nil
    @State private var selectedChatProfile: Profile? = nil
    
    @Environment(\.viewModelProvider) var viewModelProvider
    
    init(viewModel: ProfileListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
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
                    .listStyle(.plain)
                    .navigationTitle("Мои профили")
                    .navigationDestination(item: $selectedProfile) { profile in
                        ProfileDetailView(profileId: profile.id)
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
                NavigationLink(destination: ProfileSetupView(viewModelProvider: viewModelProvider)) {
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
