//
//  UIBarButtonItem+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

extension UINavigationItem {

    func addRightItem(barButtonItem: UIBarButtonItem) -> UIBarButtonItem {
        var items = rightBarButtonItems ?? []
        items.append(barButtonItem)
        setRightBarButtonItems(items, animated: true)

        return barButtonItem
    }
    func addLeftItem(barButtonItem: UIBarButtonItem) -> UIBarButtonItem {
        var items = leftBarButtonItems ?? []
        items.append(barButtonItem)
        setLeftBarButtonItems(items, animated: true)

        return barButtonItem
    }

    func addRightItem(barButtonSystemItem: UIBarButtonSystemItem) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        return addRightItem(barButtonItem: barButtonItem)
    }
    func addLeftItem(barButtonSystemItem: UIBarButtonSystemItem) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
        return addLeftItem(barButtonItem: barButtonItem)
    }


    func addRightItem(title: String, style: UIBarButtonItemStyle = .plain) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(title: title, style: style, target: nil, action: nil)
        return addRightItem(barButtonItem: barButtonItem)
    }
    func addLeftItem(title: String, style: UIBarButtonItemStyle = .plain) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(title: title, style: style, target: nil, action: nil)
        return addLeftItem(barButtonItem: barButtonItem)
    }
}
