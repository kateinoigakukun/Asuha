//
//  URL+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

public extension URL {
    public var queryItem: [String: String] {
        let splitedQuery = self.query?
            .components(separatedBy: CharacterSet(charactersIn: "&"))

        var params: [String:String] = [:]
        splitedQuery?.forEach{ item in
            let item = item.components(separatedBy: CharacterSet(charactersIn: "="))
            guard let key = item.asuha[safe: 0],
                let value = item.asuha[safe: 1] else { return }
            params[key] = value
        }
        return params
    }
}
