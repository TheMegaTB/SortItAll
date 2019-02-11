//
//  Array+SortWithAlgorithm.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func sorted(with algorithm: SortingAlgorithm) -> [Element] {
        return algorithm.sort(self)
    }
}
