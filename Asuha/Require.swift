//
//  Require.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/16.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import Foundation

extension Optional {
    func require(file: String = #file, line: UInt = #line, hint: String) -> Wrapped {
        guard let value = self else {
            var message = "Required value was nil in \(file), at line \(line). "
            message.append("\n ☠\(hint)")
            preconditionFailure(message)
        }
        return value
    }
}
