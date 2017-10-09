//
//  NSObject+Rx.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import RxSwift

private var disposeBagKey = 0
public extension Reactive where Base: NSObject {

    public var bag: DisposeBag {
        get {
            guard let bag = objc_getAssociatedObject(self, &disposeBagKey) as? DisposeBag else {
                let newDisposeBag = DisposeBag()
                setDisposeBag(with: newDisposeBag)
                return newDisposeBag
            }
            return bag
        }
        set {
            setDisposeBag(with: newValue)
        }
    }

    private func setDisposeBag(with bag: DisposeBag) {
        objc_setAssociatedObject(self, &disposeBagKey, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
