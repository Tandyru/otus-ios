//
//  ProfileDetailView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import SwiftUI

struct ProfileDetailView: View {
    @StateObject private var viewModel: ProfileDetailViewModel
    @Environment(\.viewModelProvider) var viewModelProvider
    @State private var isEditing = false
    @State private var isChating = false
    
    init(profileId: UUID) {
        _viewModel = StateObject(wrappedValue: ProfileDetailViewModel(profileId: profileId))
    }

    var body: some View {
        if let profile = viewModel.profile {
            content(for: profile)
                .padding()
                //.navigationTitle("Детали профиля")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isEditing = true
                        } label: {
                            Image(systemName: "pencil")
                        }
                    }
                }
                .navigationDestination(isPresented: $isEditing) {
                    ProfileSetupView(viewModelProvider: viewModelProvider, existingProfile: profile)
                }
                .safeAreaInset(edge: .bottom) { // Добавлено
                    Button {
                        isChating = true
                    } label: {
                        Text("Чат")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(
                                Capsule()
                                    .fill(Color.accentColor)
                                    .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 2)
                            )
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .background(Color.clear)
                }
                .navigationDestination(isPresented: $isChating) {
                    if let profile = viewModel.profile {
                        ChatView(profile: profile)
                    }
                }
        } else {
            ProgressView()
        }
    }
        
    private func content(for profile: Profile) -> some View
    {
        VStack(alignment: .leading) {
            Text(profile.title)
                .font(.title)
            Text(profile.purpose)
                .font(.subheadline)
                .foregroundColor(.secondary)
            VStack(alignment: .leading, spacing: 8) {
                Text("Параметры")
                    .font(.headline)

                ForEach(profile.parameters, id: \.id) { parameter in
                    ParameterRow(name: parameter.title, value: parameter.detailDescription)
                }
            }
            .padding(.top, 16)

            Spacer()
        }
    }
}

struct ParameterRow: View {
    let name: String
    let value: String
    
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .foregroundColor(.primary)
        }
    }
}
