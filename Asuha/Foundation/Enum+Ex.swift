//
//  Enum+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/02.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public protocol EnumExtension {}

private struct EnumIterator<E: Hashable>: IteratorProtocol {
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

public extension EnumExtension where Self: Hashable {
    public static var all: [Self] {
        return Array(IteratorSequence(EnumIterator(type: Self.self)))
    }

    public static func create(hashValue: Int) -> Self? {
        var hash = hashValue

        let element = withUnsafePointer(to: &hash) { UnsafeRawPointer($0) }.load(as: Self.self)

        guard element.hashValue == hashValue else {
            return nil
        }

        return element
    }

    init?(hashValue: Int) {
        guard let element = Self.create(hashValue: hashValue) else { return nil }
        self = element
    }
}

public extension EnumExtension {
    public var string: String {
        return String(describing: self)
    }
}
