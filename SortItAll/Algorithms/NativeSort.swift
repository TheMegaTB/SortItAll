//
//  NativeSort.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 18.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct NativeSort: SortingAlgorithm {
    let name = "NativeSort"

    func sort<Element: Comparable>(_ array: inout [Element]) {
        array.sort()
    }
}
