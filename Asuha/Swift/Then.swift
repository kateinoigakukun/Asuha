//
//  Then.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/08/15.
//  Copyright © 2017年 bangohan. All rights reserved.
//

extension Asuha where Base: AnyObject {
    public func then(with block: (Base) -> Void) -> Base {
        block(base)
        return base
    }
}
