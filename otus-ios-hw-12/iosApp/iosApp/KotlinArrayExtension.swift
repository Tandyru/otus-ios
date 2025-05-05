//
//  KotlinArrayExtension.swift
//  iosApp
//
//  Created by Andrey Tanakov on 05.05.2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import shared

extension KotlinArray where T == NSString {
    func toSwiftArray() -> [String] {
        var result = [String]()
        for i in 0..<self.size {
            if let element = self.get(index: i) {
                result.append(element as String)
            }
        }
        return result
    }
}
