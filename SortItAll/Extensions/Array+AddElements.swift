//
//  Array+AddElements.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

extension Array {
    func combinedWith(array: [Element], using closure: (Element, Element) -> Element) -> [Element] {
        return zip(self, array).map { x in
            let (ownElement, foreignElement) = x
            return closure(ownElement, foreignElement)
        }
    }
}
