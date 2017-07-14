//
//  ObservableType+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import RxSwift

public extension ObservableType {
    public func subscribe(onNext: @escaping ((Self.E) -> Void)) -> Disposable {
        return subscribe(onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil)
    }
}

public extension ObservableType where E: AnyOptional {
    
    public func filterNil() -> Observable<E.Wrapped> {
        return self.flatMap { element -> Observable<E.Wrapped> in
            guard let value = element.value else {
                return Observable<E.Wrapped>.empty()
            }
            return Observable<E.Wrapped>.just(value)
        }
    }
}

public extension ObservableType where E: AnyArray {
    public func filterEmpty() -> Observable<E> {
        return self.flatMap { element -> Observable<E> in
            guard element.isEmpty.asuha.negated else {
                return Observable<E>.empty()
            }
            return Observable<E>.just(element)
        }
    }
}

public extension ObservableType where E: AnyOptional, E.Wrapped: Equatable {

    public func distinctUntilChanged() -> Observable<E> {
        return self.distinctUntilChanged { (lhs, rhs) -> Bool in
            return lhs.value == rhs.value
        }
    }
}
