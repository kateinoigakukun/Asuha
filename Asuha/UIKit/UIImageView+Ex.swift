//
//  UIImageView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension UIImageView {
    public func circlize() {
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
    }
}
