//
//  Operators.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

infix operator ||= : AssignmentPrecedence

public func ||= <T>( rhs: inout T?, lhs: T) {
    if rhs == nil {
        rhs = lhs
    }
}
