//
//  Asuha.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/07/14.
//  Copyright © 2017年 bangohan. All rights reserved.
//

public struct Asuha<Base> {

    public var base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

public protocol AsuhaCompatible {

    associatedtype CompatibleType

    static var asuha: Asuha<CompatibleType>.Type { get }

    var asuha: Asuha<CompatibleType> { get }
}

extension AsuhaCompatible {

    public static var asuha: Asuha<Self>.Type {
        return Asuha<Self>.self
    }

    public var asuha: Asuha<Self> {
        return Asuha(self)
    }
}

extension NSObject: AsuhaCompatible {}
