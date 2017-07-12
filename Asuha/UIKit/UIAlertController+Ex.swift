//
//  UIAlertController+Ex.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/30.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import Foundation

extension UIAlertController {
    public func title(_ title: String) -> UIAlertController {
        self.title = title
        return self
    }

    public func message(_ message: String) -> UIAlertController {
        self.message = message
        return self
    }

    public func addAction(title: String, handler: @escaping ()->()) -> UIAlertController {
        addAction(UIAlertAction(title: title, style: .default) { (_) in handler()})
        return self
    }

    public func addCancelAction() -> UIAlertController {
        addAction(UIAlertAction(title: nil, style: .cancel, handler: nil))
        return self
    }

    public static func style(_ style: UIAlertControllerStyle) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: style)
        return alert
    }

    public func show() {
        guard let viewController = UIApplication.shared.rootViewController else { return }
        viewController.present(self, animated: true, completion: nil)
    }
}
