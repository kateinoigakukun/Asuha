//
//  PHImageManager+Rx.swift
//  myTwi
//
//  Created by SaitoYuta on 2017/04/11.
//  Copyright © 2017年 SaitoYuta. All rights reserved.
//

import RxSwift
import Photos

extension Reactive where Base: PHAsset {
    var requestVideo: Observable<AVAsset> {
        return Observable.create { (observer) -> Disposable in

            PHImageManager().requestAVAsset(forVideo: self.base, options: nil) {
                (asset, _, _) in
                guard let asset = asset else { return }
                observer.onNext(asset)
            }
            return Disposables.create()
        }
    }
}
