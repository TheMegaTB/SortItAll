//
//  SortedData.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

class SortedData<Element: BinaryInteger>: InputData<Element> where Element.Stride: SignedInteger {
    init() {
        super.init(name: "Sorted") { size in
            return Array((0..<Element(size)))
        }
    }
}
