//
//  UINavigationController+extension.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import UIKit

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
