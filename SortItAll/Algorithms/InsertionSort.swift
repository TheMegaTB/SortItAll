//
//  InsertionSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct InsertionSort: InplaceSortingAlgorithm {
    let name = "InsertionSort"

    func sortInplace<T>(_ array: inout [T]) where T : Comparable {
        for i in 1...array.count - 1  {
            let v = array[i]
            var j = i - 1
            while j >= 0 && array[j] > v {
                array[j + 1] = array[j]
                j -= 1
            }
            array[j + 1] = v
        }
    }
}
