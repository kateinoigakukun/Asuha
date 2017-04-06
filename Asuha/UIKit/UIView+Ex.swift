//
//  UIView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

extension UIView {
    func updateFrame(x: CGFloat? = nil, y: CGFloat? = nil,
                     width: CGFloat? = nil, height: CGFloat? = nil) {

        let viewFrame = CGRect(x: x ?? frame.origin.x,
                               y: y ?? frame.origin.y,
                               width: width ?? frame.width,
                               height: height ?? frame.height)
        frame = viewFrame
    }

    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { view in
            self.addSubview(view)
        }
    }
}

protocol NibHelper {}

extension NibHelper where Self: UIView {
    static func instantiate() -> Self {
        let nib = UINib(nibName: self.className, bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}

extension UIView: NibHelper {}
