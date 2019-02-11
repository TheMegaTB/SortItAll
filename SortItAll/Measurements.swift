//
//  Measurements.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

@discardableResult
func measureRuntime<B>(of function: @autoclosure () -> B) -> (returnValue: B, duration: TimeInterval) {
    let startTime = Date()
    let returnValue = function()
    let duration = Date().timeIntervalSince(startTime)

    return (returnValue: returnValue, duration: duration)
}

@discardableResult
func measureAverageRuntime<B>(of function: @autoclosure () -> B, withRuns: Int) -> TimeInterval {
    let totalDuration = (0...withRuns).reduce(0) { (acc, _) in
        return acc + measureRuntime(of: function).duration
    }

    return totalDuration / Double(withRuns)
}
