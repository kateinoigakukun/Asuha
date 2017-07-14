//
//  UIViewController+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

extension Asuha where Base: UIViewController {
    public static func instantiate(_ storyboard: String = className) -> Base {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Base
    }
}
