//
//  UIViewController+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

extension Asuha where Base: UIViewController {
    public static func instantiate(storyboardName: String = className) -> Base {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController() ?? storyboard.instantiateViewController(withIdentifier: storyboardName)
        return vc as! Base
    }
}
