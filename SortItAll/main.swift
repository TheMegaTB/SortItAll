//
//  main.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

let targetLocation = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Downloads")
    .appendingPathComponent("sorting.csv")
let numberFormatter = NumberFormatter()
numberFormatter.minimumIntegerDigits = 1
numberFormatter.minimumFractionDigits = 8

let algorithms: [SortingAlgorithm] = [QuickSort(), MergeSort(), InsertionSort(), SelectionSort(), BubbleSort()]
let dataTypes: [InputData<Int>] = [ReverseSortedData(), RandomData(), SortedData(), AlmostSortedData()]

let rem = RuntimeEvaluationManager(runCount: 3, algorithms: algorithms, dataTypes: dataTypes)

let sizes = (1...50).map { $0 * 100 }

// x = [InputSize: [InputType: [Algorithm: Duration]]]
let x = rem.evaluate(sizes: sizes)
// y = [InputSize: [InputType+Algorithm: Duration]]
let y = x.map { $0.flatMap { $0 } }

let columnNames = dataTypes.flatMap { type in
    algorithms.map { algorithm in
        return "\(type.name) | \(algorithm.name)"
    }
}

let csvWriter = CSVWriter(columnNames: columnNames, rowNames: sizes.map { String(describing: $0) }, data: y)
csvWriter.numberFormatter = numberFormatter
try! csvWriter.write(to: targetLocation)
