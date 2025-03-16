//
//  BrowserViewControllerRepresentable.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import SwiftUI
import MultipeerConnectivity

struct BrowserViewControllerRepresentable: UIViewControllerRepresentable {
    @Inject private var serviceTypeProvider: ServiceTypeProvider
    @Inject private var sessionService: SessionService
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> MCBrowserViewController {
        let browserVC = MCBrowserViewController(serviceType: serviceTypeProvider.serviceType, session: sessionService.session)
        //let browserVC = MCBrowserViewController(browser: peeringService.browser, session: sessionService.session)
        browserVC.delegate = context.coordinator
        return browserVC
    }
    
    func updateUIViewController(_ uiViewController: MCBrowserViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented)
    }
    
    class Coordinator: NSObject, MCBrowserViewControllerDelegate {
        @Binding var isPresented: Bool
        
        init(isPresented: Binding<Bool>) {
            _isPresented = isPresented
        }
        
        func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
            isPresented = false
        }
        
        func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
            isPresented = false
        }
    }
}
