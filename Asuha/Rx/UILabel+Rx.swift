//
//  UILabel+Rx.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/20.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UILabel {
    public var textColor: Binder<UIColor> {
        return Binder(base) { (base, color) in
            base.textColor = color
        }
    }
}
