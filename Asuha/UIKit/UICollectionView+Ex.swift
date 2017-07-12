//
//  UICollectionView+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func register<T: UICollectionViewCell>(cellType: T.Type) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }

    public func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type = T.self, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
