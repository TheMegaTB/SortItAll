//
//  BogoSort.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct BogoSort: SortingAlgorithm {
    let name = "BogoSort"

    func sort<Element: Comparable>(_ array: inout [Element]) {
        while !array.isSorted() {
            array.shuffle()
        }
    }
}
