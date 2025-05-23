//
//  ProfileListCell.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import SwiftUI
import CoreProfile

struct ProfileCell: View {
    let profile: Profile
    var onProfileTapped: () -> Void
    var onChatTapped: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: onChatTapped) {
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(profile.title)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)
                        Text(profile.purpose)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
            }
            .contentShape(Rectangle())
            Button(action: onProfileTapped) {
                Image(systemName: "slider.vertical.3")
                    .foregroundColor(.blue)
                    .padding(.leading, 8)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.listCellBackground)
    }
}

