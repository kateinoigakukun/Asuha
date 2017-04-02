//
//  UIViewController+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

protocol StoryBoardHelper {}

extension StoryBoardHelper where Self: UIViewController {
    static func instantiate(_ storyboard: String = Self.className) -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.className) as! Self
    }
}

extension UIViewController: StoryBoardHelper {}
