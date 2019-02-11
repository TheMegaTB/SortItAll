//
//  InputData.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

protocol InputData {
    associatedtype Element: Comparable

    var name: String { get }

    func next(withSize size: Int) -> [Element]
}
