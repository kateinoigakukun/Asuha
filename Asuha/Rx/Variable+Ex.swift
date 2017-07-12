//
//  Variable+Ex.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/10.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import RxSwift

extension Variable where Element: AnyArray {
    public func asAppendable() -> AnyObserver<Element.Element> {
        return AnyObserver(nextEventHandler: { (element) in
            self.value.append(element)
        })
    }
}
