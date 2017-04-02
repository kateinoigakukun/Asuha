//
//  String+Ex.swift
//  Asuha
//
//  Created by SaitoYuta on 2017/04/01.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

extension String {
    func contains(_ find: String, ignoreCase: Bool = true) -> Bool{
        let option: NSString.CompareOptions = {
            return ignoreCase ? .caseInsensitive : .literal

        }()
        return self.range(of: find, options: option) != nil
    }
}

extension String {
    func unescapeHTML() -> String {
        var newStr = self
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
    func escapeHTML() -> String {
        var newStr = self
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
