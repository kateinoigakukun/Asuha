//
//  Dictionary+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public protocol AnyDictionary {
    associatedtype Key: Hashable
    associatedtype Value
    func filter(_ isIncluded: ((key: Key, value: Value)) throws -> Bool) rethrows -> [(key: Key, value: Value)]
}

extension Dictionary: AnyDictionary {}
extension Dictionary: AsuhaCompatible {}

public extension Asuha where Base: AnyDictionary, Base.Value: Equatable {
    public func allKeysFor(_ value : Base.Value) -> [Base.Key] {
        return base.filter { $1 == value }.map { $0.0 }
    }
}
