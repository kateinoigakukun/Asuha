//
//  UITableView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension UITableView {
    public func register<T: UITableViewCell>(forClass type: T.Type) {
        let className: String = type.className
        register(type, forCellReuseIdentifier: className)
    }

    public func register<T: UITableViewCell>(forNib type: T.Type) {
        let className: String = type.className
        let nib: UINib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }

    public func register<T: UITableViewCell>(forClasses types: [T.Type]) {
        types.forEach { register(forClass: $0) }
    }

    public func register<T: UITableViewCell>(forNibs types: [T.Type]) {
        types.forEach { register(forNib: $0) }
    }
}
