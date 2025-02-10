//
//  ShareViewController.swift
//  otus_ios_hw_6_share_ext
//
//  Created by Andrey Tanakov on 08.02.2025.
//

import UIKit
import Social
import MobileCoreServices
import UniformTypeIdentifiers

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        defer {
            extensionContext?.completeRequest(returningItems: [], completionHandler: nil)
        }
        guard let inputItems = extensionContext?.inputItems as? [NSExtensionItem] else {
            return
        }
        
        for item in inputItems {
            guard let providers = item.attachments else { continue }
            for provider in providers {
                if provider.hasItemConformingToTypeIdentifier(UTType.text.identifier) {
                    provider.loadItem(forTypeIdentifier: UTType.text.identifier) { text, error in
                        guard let text = text as? String else { return }
                        let sharedDefaults = UserDefaults(suiteName: "group.com.tandyru.otus-ios-hw-6")
                        sharedDefaults?.set(text, forKey: "sharedText")
                        _ = self.openMainApp()
                    }
                }
            }
        }
    }

    private func openMainApp() -> Bool {
        let url = URL(string: "tandyruotushwsix://get-shared-text")!
        var responder = self as UIResponder?
        
        while responder != nil {
            if let application = responder as? UIApplication {
                Task {
                    application.open(url)
                }
                return true
            }
            responder = responder?.next
        }
        return false
    }
    
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

}
