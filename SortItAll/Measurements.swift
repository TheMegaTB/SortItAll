//
//  Measurements.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

@discardableResult
func measureRuntime(of function: @autoclosure () -> Void) -> TimeInterval {
    let startTime = Date()
    function()
    let duration = Date().timeIntervalSince(startTime)

    return duration
}
