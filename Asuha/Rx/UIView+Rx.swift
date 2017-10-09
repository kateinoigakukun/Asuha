//
//  UIView+Rx.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/15.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

public extension Reactive where Base: UIView {
    var backgroundColor: Binder<UIColor> {
        return Binder(base) { view, backgroundColor in
            view.backgroundColor = backgroundColor
        }
    }
}
