//
//  SFSafariViewController+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import SafariServices
import UIKit

public extension Asuha where Base: SFSafariViewController {
    public static func open(_ url: URL) {
        guard let window = UIApplication.shared.delegate?.window,
            let rootVC = window?.rootViewController else {
                return
        }

        let safariVC = SFSafariViewController(url: url)
        rootVC.present(safariVC, animated: true)
    }
}
