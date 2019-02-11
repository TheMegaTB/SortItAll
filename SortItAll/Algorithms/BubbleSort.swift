//
//  BubbleSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct BubbleSort: InplaceSortingAlgorithm {
    let name = "BubbleSort"

    func sortInplace<T>(_ array: inout [T]) where T : Comparable {
        for i in 0..<array.count - 1  {
            for j in 0..<array.count - 1 - i {
                if array[j + 1] < array[j] { array.swapAt(j, j + 1) }
            }
        }
    }
}
