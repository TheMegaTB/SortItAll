//
//  TimeInterval+HumanReadable.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

extension TimeInterval {
    var humanReadable: String {
        var durationString = ""

        if self >= 60 {
            durationString += "\(Int(self / 60))min"
        }

        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        if seconds > 0 {
            durationString += " \(seconds)s"
        }

        let milliseconds = Int((self * 1000).truncatingRemainder(dividingBy: 1000))
        if milliseconds > 0 {
            durationString += " \(milliseconds)ms"
        }

        let microseconds = Int((self * 1000000).truncatingRemainder(dividingBy: 1000))
        if microseconds > 0 {
            durationString += " \(microseconds)μs"
        }

        return durationString.trimmingCharacters(in: .whitespaces)
    }
}
