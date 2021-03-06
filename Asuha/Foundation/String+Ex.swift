//
//  String+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

extension String: AsuhaCompatible {}
public extension Asuha where Base == String {
    public func contains(_ find: String, ignoreCase: Bool = true) -> Bool{
        let option: NSString.CompareOptions = {
            return ignoreCase ? .caseInsensitive : .literal
        }()
        return base.range(of: find, options: option) != nil
    }
    var length: Int {
        return (base as NSString).length
    }
}

public extension Asuha where Base == String {
    public func unescapeHTML() -> String {
        var newStr = base
        let char_dict = [
            "&amp;": "&",
            "&lt;": "<",
            "&gt;": ">",
            "&quot;": "\"",
            "&apos;": "'"
        ]
        for (escaped_char, unescaped_char) in char_dict {
            newStr = newStr.replacingOccurrences(of: escaped_char, with: unescaped_char)
        }
        return newStr
    }
    public func escapeHTML() -> String {
        var newStr = base
        let char_dict = [
            "&amp;": "&",
            "&lt;": "<",
            "&gt;": ">",
            "&quot;": "\"",
            "&apos;": "'"
        ]
        for (escaped_char, unescaped_char) in char_dict {
            newStr = newStr.replacingOccurrences(of: unescaped_char, with: escaped_char)
        }
        return newStr
    }
}
