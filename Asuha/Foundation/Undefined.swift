//
//  Undefined.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/05/20.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public func undefined<T>(_ funcName: String=#function) -> T {
    fatalError("\(funcName) is undefined.")
}
