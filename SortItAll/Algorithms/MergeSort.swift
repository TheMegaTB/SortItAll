//
//  MergeSort.swift
//  SortItAll
//
//  Created by Noah Peeters on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

struct MergeSort: InplaceSortingAlgorithm {
    let name = "MergeSort"

    func sortInplace<T>(_ array: inout [T]) where T : Comparable {
        if array.count > 1 {
            let arrayB = sort(Array(array[...(array.count/2 - 1)]))
            let arrayC = sort(Array(array[(array.count/2)...]))
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
