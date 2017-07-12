//
//  AnyObserver+Ex.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/10.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import RxSwift

extension AnyObserver {
    public init(nextEventHandler: @escaping (Element) -> Void) {
        self.init(eventHandler: { event in
            guard case let .next(element) = event else {
                return
            }
            nextEventHandler(element)
        })
    }
}
