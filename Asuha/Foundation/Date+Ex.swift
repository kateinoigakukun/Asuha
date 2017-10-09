//
//  Date+Ex.swift
//  AthleteMemory
//
//  Created by SaitoYuta on 2017/09/08.
//  Copyright © 2017年 bangohan. All rights reserved.
//

import Foundation

private let formatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.timeZone = .current
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.calendar = Calendar(identifier: .gregorian)
    return formatter
}()

extension Date: AsuhaCompatible {}

public extension Asuha where Base == Date {

    public func string(format: String) -> String {
        formatter.dateFormat = format
        return formatter.string(from: base)
    }

    public static func date(string: String, format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        formatter.dateFormat = format
        return formatter.date(from: string)
    }
}
