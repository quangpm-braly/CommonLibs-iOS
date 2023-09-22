//
//  ArrayExtensions.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import Foundation

public extension Array {
    subscript (safe index: Index) -> Element? {
        return 0 <= index && index < count ? self[index] : nil
    }
}

public extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

public extension Array {
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
