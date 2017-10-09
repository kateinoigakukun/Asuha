//
//  NSObject+Rx.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import RxSwift

fileprivate struct AssociatedKeys {
    static var disposeBag = "disposeBag"
}

public protocol HasDisposeBag: class {
    var disposeBag: DisposeBag { get set }
}

extension HasDisposeBag {

    private func doLocked(forClosure closure: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        closure()
    }
    public var disposeBag: DisposeBag {
        get {
            var rxDisposeBag: DisposeBag!
            doLocked {
                if let bag = objc_getAssociatedObject(self, &AssociatedKeys.disposeBag) as? DisposeBag {
                    rxDisposeBag = bag
                } else {
                    let newDisposeBag = DisposeBag()
                    objc_setAssociatedObject(self, &AssociatedKeys.disposeBag, newDisposeBag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    rxDisposeBag = newDisposeBag
                }
            }
            return rxDisposeBag
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disposeBag, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

public extension Reactive where Base: HasDisposeBag {

    var bag: DisposeBag {
        get { return base.disposeBag }
        set {
            let mutableBase = base
            mutableBase.disposeBag = newValue
        }
    }
}

extension NSObject: HasDisposeBag {}
