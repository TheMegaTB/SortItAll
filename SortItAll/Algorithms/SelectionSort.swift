//
//  SelectionSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct SelectionSort: InplaceSortingAlgorithm {
    let name = "SelectionSort"

    func sortInplace<T>(_ array: inout [T]) where T : Comparable {
        for i in 0...array.count - 2  {
            var min = i
            for j in i + 1...array.count - 1 {
                if array[j] < array[min] { min = j }
            }
            array.swapAt(i, min)
        }
    }
}
