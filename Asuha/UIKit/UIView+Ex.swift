//
//  UIView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension UIView {
    public func updateFrame(x: CGFloat? = nil, y: CGFloat? = nil,
                     width: CGFloat? = nil, height: CGFloat? = nil) {

        let viewFrame = CGRect(x: x ?? frame.origin.x,
                               y: y ?? frame.origin.y,
                               width: width ?? frame.width,
                               height: height ?? frame.height)
        frame = viewFrame
    }

    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { view in
            self.addSubview(view)
        }
    }

    public func removeFromSuperview(animated: Bool, withDuration duration: TimeInterval, options: UIViewAnimationOptions = .curveEaseIn) {
        
        if !animated { self.removeFromSuperview() }
        UIView.animate(withDuration: duration, delay: 0.0, options: options,
                       animations: { [unowned self] in
                        self.alpha = 0.0
            }, completion: { [unowned self] _ in
                self.removeFromSuperview()
        })
    }
}

public protocol NibHelper {}

public extension NibHelper where Self: UIView {
    static func instantiate() -> Self {
        let nib = UINib(nibName: self.className, bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }

    init(fromNib: Void) {
        self = Self.instantiate()
    }
}

extension UIView: NibHelper {}

let v = UIView(fromNib: ())
