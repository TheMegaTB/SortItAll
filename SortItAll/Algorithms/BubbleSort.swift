//
//  BubbleSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct BubbleSort: SortingAlgorithm {
    let name = "BubbleSort"

    func sort<Element: Comparable>(_ array: inout [Element]) {
        for i in 0...array.count - 2  {
            for j in 0...array.count - 2 - i {
                if array[j + 1] < array[j] { array.swapAt(j, j + 1) }
            }
        }
    }
}
