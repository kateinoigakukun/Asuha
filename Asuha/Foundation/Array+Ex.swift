//
//  Array+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        get {
            return self.indices ~= index ? self[index] : nil
        }
        set (value) {
            if value == nil {
                return
            }
            if !(self.indices ~= index) {
                return
            }
            self[index] = value!
        }
    }
}

extension Array where Element: Equatable {
    mutating func appendUnique(element: Element) {
        if contains(element) { return }
        append(element)
    }

    mutating func appendUnique(contentsOf: [Element]) {
        let contents = contentsOf.filter { !self.contains($0) }
        append(contentsOf: contents)
    }
}
