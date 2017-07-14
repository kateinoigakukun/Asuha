//
//  UICollectionView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension Asuha where Base: UICollectionView {
    public func register<T: UICollectionViewCell>(cellType: T.Type) {
        let className = cellType.asuha.className
        let nib = UINib(nibName: className, bundle: nil)
        base.register(nib, forCellWithReuseIdentifier: className)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type = T.self, for indexPath: IndexPath) -> T {
        return base.dequeueReusableCell(withReuseIdentifier: type.asuha.className, for: indexPath) as! T
    }
}
