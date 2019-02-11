//
//  main.swift
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

// MARK: - Implementations
func bogoSort<T: Comparable>(_ array: [T]) -> [T] {
    var a = array
    while !a.isSorted() { a.shuffle() }
    return a
}

// MARK: - Extensions
enum SortingAlgorithm {
    case bogoSort
}

extension Array where Element: Comparable {
    func isSorted() -> Bool {
        return self.reduce((sorted: true, previousElement: nil)) { (acc: (Bool, Element?), currentElement: Element) in
            let (sorted, previousElement) = acc
            let isSorted = sorted && previousElement.flatMap { $0 <= currentElement } ?? true
            return (isSorted, currentElement)
            }.0
    }

    func sorted(with algorithm: SortingAlgorithm) -> [Element] {
        switch algorithm {
        case .bogoSort:
            return bogoSort(self)
        }
    }
}

let arrayLength = 5

let sortedArray = Array((0...arrayLength))
let reverseSortedArray = Array(sortedArray.reversed())
let randomArray = Array(sortedArray.shuffled())

measureRuntime(of: reverseSortedArray.sorted(with: .bogoSort))
