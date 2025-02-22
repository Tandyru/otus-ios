//
//  CameraView.swift
//  otus-ios-hw-7
//
//  Created by Andrey Tanakov on 16.02.2025.
//

import SwiftUI

struct CameraView: View {
    @StateObject private var cameraManager = CameraManager()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if let image = cameraManager.cameraImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("Загрузка камеры...")
            }
            BoundingRectanglesView(objectsWithBoxes: cameraManager.objectsWithBoxes)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            cameraManager.configureCamera()
        }
        .onDisappear {
            cameraManager.stopSession()
        }
    }
}

struct BoundingRectanglesView: View {
    let objectsWithBoxes: [(label: String, confidence: Float, bounds: CGRect)]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ForEach(objectsWithBoxes.indices, id: \.self) { index in
                let objectWithBox = objectsWithBoxes[index]
                let bounds = objectWithBox.bounds
                Rectangle()
                    .stroke(Color.red, lineWidth: 2)
                    .frame(width: bounds.width, height: bounds.height)
                    .position(x: bounds.midX, y: bounds.midY)
                let label = objectWithBox.label
                let confidence = objectWithBox.confidence
                Text("\(label)(\(confidence))")
                    .font(.caption)
                    .background(Color.white.opacity(0.8))
                    .offset(
                        x: objectsWithBoxes[index].bounds.minX + 5,
                        y: objectsWithBoxes[index].bounds.minY - 15
                    )
            }
        }
    }
}
