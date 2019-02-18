//
//  AlmostSortedData.swift
//  SortItAll
//
//  Created by Noah Peeters on 18.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

class AlmostSortedData<Element: BinaryInteger>: InputData<Element> where Element.Stride: SignedInteger {
    init() {
        super.init(name: "Almost Sorted") { size in
            var values = Array((0..<Element(size)))
            for _ in 0..<(values.count / 5) {
                let index = Int(arc4random_uniform(UInt32(values.count - 1)))
                values.swapAt(index, index + 1)
            }

            return values
        }
    }
}
