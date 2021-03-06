//
//  UIBarButtonItem+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension Asuha where Base: UINavigationItem {
    @discardableResult
    public func addRightItem(barButtonItem: UIBarButtonItem) -> UIBarButtonItem {
        var items = base.rightBarButtonItems ?? []
        items.append(barButtonItem)
        base.setRightBarButtonItems(items, animated: true)

        return barButtonItem
    }
    @discardableResult
    public func addLeftItem(barButtonItem: UIBarButtonItem) -> UIBarButtonItem {
        var items = base.leftBarButtonItems ?? []
        items.append(barButtonItem)
        base.setLeftBarButtonItems(items, animated: true)

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
