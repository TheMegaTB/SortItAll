//
//  SelectionSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct SelectionSort: SortingAlgorithm {
    let name = "SelectionSort"

    func sort<Element: Comparable>(_ array: inout [Element]) {
        for i in 0...array.count - 2  {
            var min = i
            for j in i + 1...array.count - 1 {
                if array[j] < array[min] { min = j }
            }
            array.swapAt(i, min)
        }
    }
}
