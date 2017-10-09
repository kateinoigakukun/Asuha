//
//  Bool+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/03.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

extension Bool: AsuhaCompatible {}
public extension Asuha where Base == Bool {
    public var negated: Bool {
        return !base
    }
}
