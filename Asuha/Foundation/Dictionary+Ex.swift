//
//  Dictionary+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public extension Dictionary where Value : Equatable {
    public func allKeysFor(_ value : Value) -> [Key] {
        return self.filter { $1 == value }.map { $0.0 }
    }
}
