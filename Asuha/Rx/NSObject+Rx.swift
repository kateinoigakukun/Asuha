//
//  NSObject+Rx.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import RxSwift

extension NSObject {
    struct AssociatedKeys {
        static var disposeBagKey = "DisposeBagKey"
    }
    var disposeBag: DisposeBag {
        get {
            guard let bag = objc_getAssociatedObject(self, &type(of: self).AssociatedKeys.disposeBagKey) as? DisposeBag else {
                let newDisposeBag = DisposeBag()
                self.disposeBag = newDisposeBag
                return newDisposeBag
            }
            return bag
        }
        set {
            objc_setAssociatedObject(self, &type(of: self).AssociatedKeys.disposeBagKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
