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

    typealias SubjectObserverType = ReplaySubject<Element>
    typealias E = Element

    var value: Element {
        get {
            return _value ?? undefined()
        }
        set {
            _value = newValue
            replaySubject.onNext(newValue)
        }
    }

    private var replaySubject = ReplaySubject<Element>.create(bufferSize: 1)
    private var _value: Element?

    func on(_ event: Event<Element>) {
        replaySubject.on(event)
        guard case let .next(element) = event else { return }
        _value = element
    }

    func subscribe<O>(_ observer: O) -> Disposable where O : ObserverType, O.E == Element {
        return replaySubject.subscribe(observer)
    }

    func dispose() {
        replaySubject.dispose()
    }

    func asObserver() -> ReplaySubject<Element> {
        return replaySubject
    }
}
