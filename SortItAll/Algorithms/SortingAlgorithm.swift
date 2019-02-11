//
//  SortingAlgorithm.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

protocol SortingAlgorithm {
    var name: String { get }

    func sort<T: Comparable>(_ array: [T]) -> [T]
}
