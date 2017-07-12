//
//  UITableView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension UITableView {
    // MARK: - UITableViewCell

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

    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type = T.self, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }


    // MARK: - UITableViewHeaderFooterView

    public func register<T: UITableViewHeaderFooterView>(forClass type: T.Type) {
        let className: String = type.className
        register(type, forHeaderFooterViewReuseIdentifier: className)
    }

    public func register<T: UITableViewHeaderFooterView>(forNib type: T.Type) {
        let className: String = type.className
        let nib: UINib = UINib(nibName: className, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }

    public func register<T: UITableViewHeaderFooterView>(forClasses types: [T.Type]) {
        types.forEach { register(forClass: $0) }
    }

    public func register<T: UITableViewHeaderFooterView>(forNibs types: [T.Type]) {
        types.forEach { register(forNib: $0) }
    }

    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with type: T.Type = T.self) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
    }
}
