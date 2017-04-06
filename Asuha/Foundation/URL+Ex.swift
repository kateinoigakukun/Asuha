//
//  URL+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/06.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

extension URL {
    var queryItem: [String: String] {
        let splitedQuery = self.query?
            .components(separatedBy: CharacterSet(charactersIn: "&"))

        var params: [String:String] = [:]
        splitedQuery?.forEach{ item in
            let item = item.components(separatedBy: CharacterSet(charactersIn: "="))
            params[item[0]] = item[1]
        }
        return params
    }
}
