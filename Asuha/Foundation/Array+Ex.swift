//
//  Array+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        get {
            return self.indices ~= index ? self[index] : nil
        }
        set (value) {
            if value == nil {
                return
            }

            if !(self.indices ~= index) {
                return
            }

            self[index] = value!
        }
    }
}
