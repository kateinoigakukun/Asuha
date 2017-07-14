//
//  UIView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension Asuha where Base: UIView {
    public func updateFrame(x: CGFloat? = nil, y: CGFloat? = nil,
                     width: CGFloat? = nil, height: CGFloat? = nil) {

        let viewFrame = CGRect(x: x ?? base.frame.origin.x,
                               y: y ?? base.frame.origin.y,
                               width: width ?? base.frame.width,
                               height: height ?? base.frame.height)
        base.frame = viewFrame
    }

    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { view in
            base.addSubview(view)
        }
    }

    public func removeFromSuperview(animated: Bool, withDuration duration: TimeInterval, options: UIViewAnimationOptions = .curveEaseIn) {
        
        if !animated { base.removeFromSuperview() }
        UIView.animate(withDuration: duration, delay: 0.0, options: options,
                       animations: { [weak base] in
                        base?.alpha = 0.0
            }, completion: { [weak base] _ in
                base?.removeFromSuperview()
        })
    }
}

extension Asuha where Base: UIView {
    static func instantiate() -> Base {
        let nib = UINib(nibName: className, bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as! Base
    }
}
