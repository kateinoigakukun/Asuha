//
//  UIView+Injectable.swift
//  AthleteMemory
//
//  Created by SaitoYuta on 2017/09/23.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

extension Asuha where Base: UIView, Base: Injectable & NibInstantiatable {
    public static func instantiate(with dependency: Base.Dependency) -> Base {
        return Base.asuha.instantiate().injected(with: dependency)
    }
}
