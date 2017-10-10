//
//  UIViewController+Rx.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/10/10.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let selector = #selector(UIViewController.viewWillAppear)
        return ControlEvent(events: sentMessage(selector).map { _ in })
    }
    var viewDidLoad: ControlEvent<Void> {
        let selector = #selector(UIViewController.viewDidLoad)
        return ControlEvent(events: sentMessage(selector).map { _ in })
    }
}
