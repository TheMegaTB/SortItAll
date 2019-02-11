//
//  MergeSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct MergeSort: SortingAlgorithm {
    let name = "MergeSort"

    func sort<Element: Comparable>(_ array: inout [Element]) {
        if array.count > 1 {
            var arrayB = Array(array[...(array.count/2 - 1)])
            var arrayC = Array(array[(array.count/2)...])

            sort(&arrayB)
            sort(&arrayC)

            merge(arrayB, arrayC, &array)
        }
    }

    func merge<T>(_ arrayB: [T], _ arrayC: [T], _ arrayA: inout [T]) where T : Comparable {
        var i = 0
        var j = 0
        var k = 0

        while i < arrayB.count  && j < arrayC.count {
            if arrayB[i] <= arrayC[j] {
                arrayA[k] = arrayB[i]
                i += 1
            } else {
                arrayA[k] = arrayC[j]
                j += 1
            }
            k += 1
        }

        if i == arrayB.count {
            arrayA.replaceSubrange(k...arrayB.count + arrayC.count - 1, with: arrayC[j...arrayC.count - 1])
        } else {
            arrayA.replaceSubrange(k...arrayB.count + arrayC.count - 1, with: arrayB[i...arrayB.count - 1])
        }
    }
}
