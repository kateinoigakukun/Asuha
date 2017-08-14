//
//  LazyVariable.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/05/20.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation
import RxSwift

public class LazyVariable<Element>: ObservableType, SubjectType, ObserverType, ObservableConvertibleType, Disposable {

    public typealias SubjectObserverType = ReplaySubject<Element>
    public typealias E = Element

    public var value: Element {
        get {
            return _value ?? undefined()
        }
        set {
            _value = newValue
            replaySubject.onNext(newValue)
        }
    }

    private let replaySubject = ReplaySubject<Element>.create(bufferSize: 1)
    private var _value: Element?

    public init() {}

    public func on(_ event: Event<Element>) {
        replaySubject.on(event)
        guard case let .next(element) = event else { return }
        _value = element
    }

    public func subscribe<O>(_ observer: O) -> Disposable where O : ObserverType, O.E == Element {
        return replaySubject.subscribe(observer)
    }

    public func dispose() {
        replaySubject.dispose()
    }

    public func asObserver() -> ReplaySubject<Element> {
        return replaySubject
    }

    deinit {
        replaySubject.onCompleted()
    }
}
