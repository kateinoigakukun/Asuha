//
//  LazyVariable.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/05/20.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import RxSwift

class LazyVariable<Element>: ObservableType, SubjectType, ObserverType, Disposable {

    typealias SubjectObserverType = LazyVariable<Element>
    typealias E = Element

    var value: Element {
        get {
            return _value ?? undefined()
        }
        set {
            _value = newValue
        }
    }

    private var replaySubject = ReplaySubject<Element>.create(bufferSize: 1)
    private var _value: Element?
    private var _isDisposed = false

    func on(_ event: Event<Element>) {
        guard case let .next(element) = event else { return }
        _value = element
    }

    func subscribe<O>(_ observer: O) -> Disposable where O : ObserverType, O.E == Element {
        if _isDisposed {
            observer.on(.error(RxError.disposed(object: self)))
            return Disposables.create()
        }
        guard let value = _value else { return Disposables.create() }
        observer.onNext(value)
        return Disposables.create()
    }
    
    func asObserver() -> SubjectObserverType {
        return self
    }
    
    func dispose() {
        _isDisposed = true
    }

}
