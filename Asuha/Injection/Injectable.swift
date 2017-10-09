//
//  Injectable.swift
//  AthleteMemory
//
//  Created by SaitoYuta on 2017/08/15.
//  Copyright © 2017年 bangohan. All rights reserved.
//

public protocol Injectable {
    associatedtype Dependency

    func inject(with dependency: Dependency)
}

extension Injectable {

    public func injected(with dependency: Dependency) -> Self {
        inject(with: dependency)
        return self
    }
}

extension Injectable where Dependency == Void {

    public func inject(with dependency: Dependency) {}
}
