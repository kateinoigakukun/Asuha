//
//  UITableView+Injectable.swift
//  AthleteMemory
//
//  Created by SaitoYuta on 2017/09/22.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public protocol NibInstantiatableCell: NibInstantiatable {}
public protocol ClassInstantiatableCell {}

public protocol NibInstantiatableHeader: NibInstantiatable {}
public protocol ClassInstantiatableHeader {}

extension Asuha where Base: UITableView {
    public func register<T: UITableViewCell>(forClass type: T.Type) where T: ClassInstantiatableCell {
        let className: String = type.asuha.className
        base.register(type, forCellReuseIdentifier: className)
    }

    public func register<T: UITableViewCell>(forNib type: T.Type) where T: NibInstantiatableCell {
        let className: String = type.asuha.className
        let nib: UINib = UINib(nibName: className, bundle: nil)
        base.register(nib, forCellReuseIdentifier: className)
    }

    public func dequeue<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath, dependency: T.Dependency) -> T where T: Injectable {
        return base.asuha.dequeueReusableCell(with: T.self, for: indexPath).injected(with: dependency)
    }

    public func register<T: UITableViewHeaderFooterView>(forClass type: T.Type) where T: ClassInstantiatableHeader {
        let className: String = type.asuha.className
        base.register(type, forHeaderFooterViewReuseIdentifier: className)
    }

    public func register<T: UITableViewHeaderFooterView>(forNib type: T.Type) where T: NibInstantiatableHeader {
        let className: String = type.asuha.className
        let nib: UINib = UINib(nibName: className, bundle: nil)
        base.register(nib, forHeaderFooterViewReuseIdentifier: className)
    }

    public func dequeue<T: UITableViewHeaderFooterView>(with type: T.Type, dependency: T.Dependency) -> T where T: Injectable {
        return base.asuha.dequeueReusableHeaderFooterView(with: T.self).injected(with: dependency)
    }

}

extension Asuha where Base: UITableViewCell, Base: Injectable {
    public static func dequeue(in tableView: UITableView, for indexPath: IndexPath, with dependency: Base.Dependency) -> Base {
        return tableView.asuha.dequeue(with: Base.self, for: indexPath, dependency: dependency)
    }
}

extension Asuha where Base: UITableViewCell, Base: Injectable, Base.Dependency == Void {
    public static func dequeue(in tableView: UITableView, for indexPath: IndexPath) -> Base {
        return tableView.asuha.dequeue(with: Base.self, for: indexPath, dependency: Void())
    }
}

extension Asuha where Base: UITableViewHeaderFooterView, Base: Injectable {
    public static func dequeue(in tableView: UITableView, with dependency: Base.Dependency) -> Base {
        return tableView.asuha.dequeue(with: Base.self, dependency: dependency)
    }
}

extension Asuha where Base: UITableViewHeaderFooterView, Base: Injectable, Base.Dependency == Void {
    public static func dequeue(in tableView: UITableView) -> Base {
        return tableView.asuha.dequeue(with: Base.self, dependency: Void())
    }
}
