//
//  Collection+isNearLast.swift
//  otus-ios-hw-10
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func isNearLast<Item: Identifiable>(item: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) })
        else { return false}

        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance <= 3
    }
}
