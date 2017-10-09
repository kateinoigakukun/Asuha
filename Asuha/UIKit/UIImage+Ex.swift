//
//  UIImage+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/10/04.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import UIKit

extension Asuha where Base: UIImage {

    public func resized(max length: CGFloat) -> UIImage {
        let originalSize: CGSize = base.size
        let ratio: CGFloat = length / max(originalSize.width, originalSize.height)
        let resizedSize: CGSize = CGSize(width: originalSize.width * ratio, height: originalSize.height * ratio)
        let resizedRect: CGRect = CGRect(origin: .zero, size: resizedSize)
        let resizedImage: UIImage

        if #available(iOS 10.0, *) {
            let renderer: UIGraphicsImageRenderer = UIGraphicsImageRenderer(size: resizedSize)
            resizedImage = renderer.image { _ in
                base.draw(in: resizedRect)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0)
            base.draw(in: resizedRect)
            resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }

        return resizedImage
    }
}
