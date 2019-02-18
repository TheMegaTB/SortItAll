//
//  QuickSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct QuickSort: SortingAlgorithm {
    let name = "QuickSort"

    func sort<Element: Comparable>(_ array: inout [Element]) {
        var ranges: [Range<Int>] = [0..<array.count]

        while let range = ranges.popLast() {
            if range.count > 1 {
                let index = partition(&array[range])

                ranges.append(range.startIndex..<index)
                ranges.append(index+1..<range.endIndex)
            }
        }
    }

    func partition<Element: Comparable>(_ slice: inout ArraySlice<Element>) -> Int {
        let p = slice[slice.startIndex]
        var i = slice.startIndex
        var j = slice.endIndex

        repeat {
            repeat { i += 1 } while i < slice.endIndex - 1 && slice[i] < p
            repeat { j -= 1 } while j > slice.startIndex && slice[j] > p
            slice.swapAt(i, j)
        } while i < j
        slice.swapAt(i, j)
        slice.swapAt(slice.startIndex, j)
        return j
    }
}
