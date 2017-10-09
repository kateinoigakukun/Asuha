//
//  UIViewController+Injectable.swift
//  AthleteMemory
//
//  Created by SaitoYuta on 2017/08/15.
//  Copyright © 2017年 bangohan. All rights reserved.
//


extension Asuha where Base: UIViewController, Base: Injectable & StoryboardInstantiatable {

    public static func instantiate(with dependency: Base.Dependency) -> Base {
        return Base.asuha.instantiate().asuha.then {
            $0.inject(with: dependency)
        }
    }
}

extension Asuha where Base: UIViewController, Base: Injectable {
    public static func injected(with dependency: Base.Dependency) -> Base {
        return Base().asuha.then { $0.inject(with: dependency) }
    }
}
