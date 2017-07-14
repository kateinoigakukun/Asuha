//
//  NSObject+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public extension Asuha where Base: NSObject {
    public static var className: String {
        return String(describing: Base.self)
    }

    public var className: String {
        return type(of: base).asuha.className
    }
}
