//
//  UIBarButtonItem+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension UINavigationItem {
    @discardableResult
    public func addRightItem(barButtonItem: UIBarButtonItem) -> UIBarButtonItem {
        var items = rightBarButtonItems ?? []
        items.append(barButtonItem)
        setRightBarButtonItems(items, animated: true)

        return barButtonItem
    }
    @discardableResult
    public func addLeftItem(barButtonItem: UIBarButtonItem) -> UIBarButtonItem {
        var items = leftBarButtonItems ?? []
        items.append(barButtonItem)
        setLeftBarButtonItems(items, animated: true)

        return barButtonItem
    }

    public func addRightItem(barButtonSystemItem: UIBarButtonSystemItem) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        return addRightItem(barButtonItem: barButtonItem)
    }
    public func addLeftItem(barButtonSystemItem: UIBarButtonSystemItem) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        return addLeftItem(barButtonItem: barButtonItem)
    }


    public func addRightItem(title: String, style: UIBarButtonItemStyle = .plain) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(title: title, style: style, target: nil, action: nil)
        return addRightItem(barButtonItem: barButtonItem)
    }
    public func addLeftItem(title: String, style: UIBarButtonItemStyle = .plain) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(title: title, style: style, target: nil, action: nil)
        return addLeftItem(barButtonItem: barButtonItem)
    }
}
