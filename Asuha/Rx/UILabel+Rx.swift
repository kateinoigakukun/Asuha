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
    var textColor: UIBindingObserver<Base, UIColor> {
        return UIBindingObserver(UIElement: self.base) { label, color in
            label.textColor = color
        }
    }

}
