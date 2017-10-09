//
//  UIViewController+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
}
public extension StoryboardInstantiatable where Self: UIViewController{
    static var storyboardName: String {
        return asuha.className
    }
}

public extension Asuha where Base: UIViewController, Base: StoryboardInstantiatable {
    static func instantiate() -> Base {
        let storyboard = UIStoryboard(name: Base.storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController() ?? storyboard.instantiateViewController(withIdentifier: Base.storyboardName)
        return vc as! Base
    }

    func add(_ viewController: UIViewController?, blowSubview: UIView? = nil) {
        guard let viewController = viewController else { return }
        guard case .none = viewController.parent else { return }

        base.addChildViewController(viewController)
        if let subview = blowSubview {
            base.view.insertSubview(viewController.view, belowSubview: subview)
        } else {
            base.view.addSubview(viewController.view)
        }
        base.view.asuha.addConstraints(for: viewController.view)

        if base.view is UIScrollView {
            base.view.asuha.addSizeConstraints(for: viewController.view)
        }
        viewController.didMove(toParentViewController: base)
    }

    func remove(_ viewController: UIViewController?) {
        guard let viewController = viewController else { return }
        guard case .some = viewController.parent else { return }

        viewController.willMove(toParentViewController: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }
}
