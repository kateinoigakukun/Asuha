//
//  SFSafariViewController+Rx.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import SafariServices
import RxSwift

public extension Reactive where Base: SFSafariViewController {
    public static var open: AnyObserver<URL> {
        return AnyObserver.init(eventHandler: { (event) in
            guard case let .next(url) = event else {
                return
            }
            Base.open(url)
        })
    }
}
