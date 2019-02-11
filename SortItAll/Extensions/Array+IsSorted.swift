//
//  Array+IsSorted.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    func isSorted() -> Bool {
        return self.reduce((sorted: true, previousElement: nil)) { (acc: (Bool, Element?), currentElement: Element) in
            let (sorted, previousElement) = acc
            let isSorted = sorted && previousElement.flatMap { $0 <= currentElement } ?? true
            return (isSorted, currentElement)
        }.0
    }
}
