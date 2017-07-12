//
//  UIScrollView+Rx.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/08.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import RxSwift
import UIKit

public extension Reactive where Base: UIScrollView {
    public var contentOffSet: Observable<CGPoint> {
        return observe(CGPoint.self, "contentOffset").filterNil()
    }
}
