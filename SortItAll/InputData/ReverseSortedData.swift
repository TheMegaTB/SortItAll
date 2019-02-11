//
//  ReverseSortedData.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct ReverseSortedData: InputData {
    typealias Element = Int

    let name = "ReverseSorted"

    func next(withSize size: Int) -> [Int] {
        return (0..<size).reversed()
    }
}
