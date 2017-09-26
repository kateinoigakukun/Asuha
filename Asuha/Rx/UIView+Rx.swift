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

extension Reactive where Base: UIView {
    public var backgroundColor: Binder<UIColor> {
        return Binder(base) { view, backgroundColor in
            view.backgroundColor = backgroundColor
        }
    }
}
