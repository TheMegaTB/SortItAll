//
//  Measurements.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

@discardableResult
func measureRuntime<B>(of function: @autoclosure () -> B) -> B {
    let startTime = Date()
    let returnValue = function()
    let duration = Date().timeIntervalSince(startTime)
    let durationMilliseconds = Double(duration) / 1000
    print("Function took \(durationMilliseconds)ms")
    return returnValue
}
