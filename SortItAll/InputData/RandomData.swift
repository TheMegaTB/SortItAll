//
//  RandomData.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct RandomData: InputData {
    typealias Element = Int

    let name = "Random"

    func next(withSize size: Int) -> [Int] {
        return (0..<size).shuffled()
    }
}
