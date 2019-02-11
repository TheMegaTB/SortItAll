//
//  BogoSort.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct BogoSort: InplaceSortingAlgorithm {
    let name = "BogoSort"

    func sortInplace<T>(_ array: inout [T]) where T : Comparable {
        while !array.isSorted() { array.shuffle() }
    }
}
