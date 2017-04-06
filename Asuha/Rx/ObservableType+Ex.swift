//
//  ObservableType+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {
    func subscribe(onNext: @escaping ((Self.E) -> Void)) -> Disposable {
        return subscribe(onNext: onNext, onError: nil, onCompleted: nil, onDisposed: nil)
    }
}

extension ObservableType where E: AnyOptional {

    func filterNil() -> Observable<E.Wrapped> {
        return self.flatMap { element -> Observable<E.Wrapped> in
            guard let value = element.value else {
                return Observable<E.Wrapped>.empty()
            }
            return Observable<E.Wrapped>.just(value)
        }
    }
}
