//
//  UIScrollView+Rx.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/08.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

public extension Reactive where Base: UIScrollView {
    var reachedBottom: ControlEvent<Void> {
        let observable = contentOffset
            .flatMap { [weak base] contentOffset -> Observable<Void> in
                guard let scrollView = base else {
                    return Observable.empty()
                }

                let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
                let y = contentOffset.y + scrollView.contentInset.top
                let threshold = max(0.0, scrollView.contentSize.height - visibleHeight)

                return y > threshold ? Observable.just(()) : Observable.empty()
        }

        return ControlEvent(events: observable)
    }

    var refreshControl: ControlEvent<Void> {
        let observable =  base.refreshControl?.rx.controlEvent(.valueChanged).asObservable() ?? .empty()
        return ControlEvent.init(events: observable)
    }
}
