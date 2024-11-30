//
//  AboutScreen.swift
//  otus-ios-hw-1
//
//  Created by Andrey Tanakov on 30.11.2024.
//

import SwiftUI

struct AboutScreen: View {
    
    @State private var isModalViewPresented = false
    
    var body: some View {
        Button {
            isModalViewPresented = true
        } label: {
            Text("ℹ️").font(.system(size: 40))
        }
        .sheet(isPresented: $isModalViewPresented) {
            ModalView()
                .presentationDetents([.medium])
        }
    }
}

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            JustifiedText(text: "Animals is a diverse group of living organisms that inhabit virtually every ecosystem on Earth. They range from microscopic single-celled creatures to massive mammals like blue whales, representing an incredible variety of life forms. Animals are characterized by their ability to move, consume organic material, reproduce sexually, and respond to stimuli in their environment. Most animals have specialized systems for breathing, digesting food, circulating nutrients, and sensing their surroundings, which distinguish them from plants and other life forms. From tiny insects to complex primates, animals play crucial roles in maintaining ecological balance and contributing to the intricate web of life on our planet.")
                .padding(20)
            Button {
                dismiss()
            } label: {
                Text("🆗").font(.system(size: 40))
            }
        }
    }
}

struct JustifiedText: UIViewRepresentable {
    let text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 20)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

#Preview {
    AboutScreen()
}
