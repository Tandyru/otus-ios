//
//  ProfileListCell.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import SwiftUI

struct ProfileCell: View {
    let profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(profile.title)
                .font(.headline)
            Text(profile.purpose)
                .font(.subheadline)
                .foregroundColor(.secondary)
/*
            HStack(spacing: 16) {
                ParameterIcon(
                    systemName: "text.bubble",
                    label: profile.parameters.tone.rawValue.capitalized
                )
                ParameterIcon(
                    systemName: "doc.plaintext",
                    label: profile.parameters.examples ? "Примеры" : "Без примеров"
                )
                ParameterIcon(
                    systemName: "ruler",
                    label: profile.parameters.responseLength.rawValue.capitalized
                )
            }
            .font(.caption)
            .foregroundColor(.secondary)
 */
        }
        .padding(.vertical, 8)
    }
}
