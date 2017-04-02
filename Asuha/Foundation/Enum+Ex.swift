//
//  Enum+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/02.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

protocol EnumExtension {}

struct EnumIterator<E: Hashable>: IteratorProtocol {
    var hash: Int

    init(type: E.Type) {
        hash = 0
    }

    mutating func next() -> E? {
        defer { hash += 1 }
        var n = hash
        let ptr = withUnsafePointer(to: &n) { UnsafeRawPointer($0) }
            .bindMemory(to: E.self, capacity: MemoryLayout<E>.size)
        guard ptr.pointee.hashValue == n else {
            return nil
        }
        return ptr.pointee
    }
}

extension EnumExtension where Self: Hashable {
    static var all: [Self] {
        return Array(IteratorSequence(EnumIterator(type: Self.self)))
    }
}
