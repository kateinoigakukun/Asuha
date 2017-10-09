//
//  Array+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public protocol AnyArray {
    associatedtype Element
    var isEmpty: Bool { get }
    var indices: CountableRange<Int> { get }

    subscript(index: Int) -> Element { get set }
    mutating func append(_ newElement: Element)
    mutating func append<S>(contentsOf newElements: S) where S : Sequence, S.Iterator.Element == Element
    func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool
}

extension AnyArray where Element: Equatable {
    func contains(_ element: Element) -> Bool {
        return contains(where: { return $0 == element })
    }
}

extension Array: AnyArray {}
extension Array: AsuhaCompatible {}

public extension Asuha where Base: AnyArray {
    public subscript (safe index: Int) -> Base.Element? {
        get {
            return base.indices ~= index ? base[index] : nil
        }
        set (value) {
            if value == nil {
                return
            }
            if !(base.indices ~= index) {
                return
            }
            base[index] = value!
        }
    }
}

public extension Asuha where Base: AnyArray, Base.Element: Equatable {

    public mutating func appendUnique(element: Base.Element) {
        if base.contains(element) { return }
        base.append(element)
    }

    public mutating func appendUnique(contentsOf: [Base.Element]) {
        let contents = contentsOf.filter { !base.contains($0) }
        base.append(contentsOf: contents)
    }
}

