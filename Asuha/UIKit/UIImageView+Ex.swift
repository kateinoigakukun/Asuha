//
//  UIImageView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension Asuha where Base: UIImageView {
    public func circlize() {
        base.layer.cornerRadius = base.frame.width/2
        base.layer.masksToBounds = true
        base.contentMode = .scaleAspectFill
    }
}
