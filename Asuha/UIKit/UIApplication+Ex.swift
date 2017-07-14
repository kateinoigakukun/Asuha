//
//  UIApplication+Ex.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/30.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import UIKit

extension Asuha where Base: UIApplication {
    public var rootViewController: UIViewController? {
        return base.keyWindow?.rootViewController
    }
}
