//
//  SortedData.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct SortedData: InputData {
    typealias Element = Int

    let name = "Sorted"

    func next(withSize size: Int) -> [Int] {
        return Array((0..<size))
    }
}
