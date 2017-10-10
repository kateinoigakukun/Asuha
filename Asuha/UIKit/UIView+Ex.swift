//
//  UIView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public protocol NibInstantiatable {}

public extension Asuha where Base: UIView, Base: NibInstantiatable {
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
    public static func instantiate() -> Base {
        let nib = UINib(nibName: className, bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil).first as! Base
    }
}

extension Asuha where Base: UIView {
    public func addConstraints(for childView: UIView, insets: UIEdgeInsets = .zero) {
        childView.translatesAutoresizingMaskIntoConstraints = false

        base.topAnchor.constraint(equalTo: childView.topAnchor, constant: insets.top).isActive = true
        base.bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: insets.bottom).isActive = true
        base.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: insets.left).isActive = true
        base.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: insets.right).isActive = true
    }

    public func addSizeConstraints(for childView: UIView, widthMultiplier: CGFloat = 1.0, heightMultiplier: CGFloat = 1.0) {
        base.widthAnchor.constraint(equalTo: childView.widthAnchor, multiplier: widthMultiplier).isActive = true
        base.heightAnchor.constraint(equalTo: childView.heightAnchor, multiplier: heightMultiplier).isActive = true
    }
}
