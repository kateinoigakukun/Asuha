//
//  AnyOptional.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public protocol AnyOptional {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: AnyOptional {
    public var value: Wrapped? {
        return self
    }
}
