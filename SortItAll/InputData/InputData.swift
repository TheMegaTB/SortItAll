//
//  InputData.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

class InputData<Element: Comparable> {
    let name: String
    private let generatorFunction: (Int) -> [Element]

    init(name: String, generatorFunction: @escaping (Int) -> [Element]) {
        self.name = name
        self.generatorFunction = generatorFunction
    }

    func next(withSize size: Int) -> [Element] {
        return generatorFunction(size)
    }
}
