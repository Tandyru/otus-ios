//
//  Load3DModelView.swift
//  otus-ios-hw-11
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI
import UniformTypeIdentifiers
import RealityKit

struct Load3DModelView: View {
    @State private var modelURL: URL?
    @State private var isImporting: Bool = false

    var body: some View {
        if modelURL == nil {
            Button("Add 3D Model") {
                isImporting = true
            }
            .fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: [UTType.usdz],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    if let url = urls.first {
                        modelURL = url
                        print("Selected USDZ file: \(url)")
                    }
                case .failure(let error):
                    print("Error selecting file: \(error.localizedDescription)")
                }
            }
        }
        
        if let modelURL {
            LoadedModelPreview(url: modelURL)
                .frame(width: 300, height: 300)
        }
    }
}

struct LoadedModelPreview: View {
    let url: URL
    
    var body: some View {
        RealityView { content in
            do {
                let entity = try await Entity.load(contentsOf: url)
                content.add(entity)
            } catch {
                print("Error loading model: \(error)")
            }
        }
    }
}
