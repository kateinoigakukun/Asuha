//
//  UIBarButtonItem.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/21.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import UIKit

extension Asuha where Base: UIBarButtonItem {

    public var privateView: UIView {
        return base.value(forKey: "view") as! UIView
    }
}
