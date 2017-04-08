//
//  Driver+Ex.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/08.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import RxSwift
import RxCocoa

public extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy, E: AnyOptional {
    public func filterNil() -> Driver<E.Wrapped> {
        return self.flatMap { element -> Driver<E.Wrapped> in
            guard let value = element.value else {
                return Driver<E.Wrapped>.empty()
            }
            return Driver<E.Wrapped>.just(value)
        }
    }
}

public extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy, E: AnyOptional, E.Wrapped: Equatable {
    public func distinctUntilChanged() -> Driver<E> {
        return self.distinctUntilChanged { (lhs, rhs) -> Bool in
            return lhs.value == rhs.value
        }
    }
}
