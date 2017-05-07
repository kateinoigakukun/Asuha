//
//  UIApplication+Ex.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/30.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import UIKit

extension UIApplication {
    var rootViewController: UIViewController? {
        return self.keyWindow?.rootViewController
    }
}
