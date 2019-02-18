//
//  main.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

//let algorithms: [SortingAlgorithm] = [BubbleSort(), SelectionSort(), InsertionSort(), MergeSort()]
//let dataTypes: [InputData<Int>] = [SortedData(), RandomData(), ReverseSortedData()]
//
//let rem = RuntimeEvaluationManager(dataSize: 1000, runCount: 20, algorithms: algorithms, dataTypes: dataTypes)
//let durations = rem.evaluate()
//
//let csvWriter = CSVWriter(columnNames: algorithms.map { $0.name }, rowNames: dataTypes.map { $0.name }, data: durations)
//csvWriter.numberFormatter.minimumIntegerDigits = 1
//csvWriter.numberFormatter.minimumFractionDigits = 8

let targetLocation = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Downloads")
    .appendingPathComponent("sorting.csv")
let numberFormatter = NumberFormatter()
numberFormatter.minimumIntegerDigits = 1
numberFormatter.minimumFractionDigits = 8

let algorithms: [SortingAlgorithm] = [MergeSort(), InsertionSort(), SelectionSort(), BubbleSort()]
let dataTypes: [InputData<Int>] = [ReverseSortedData(), RandomData(), SortedData()]

let rem = RuntimeEvaluationManager(runCount: 5, algorithms: algorithms, dataTypes: dataTypes)

//let csvWriter = CSVWriter(columnNames: algorithms.map { $0.name },
//                          rowNames: dataTypes.map { $0.name },
//                          data: rem.evaluate())
//csvWriter.numberFormatter = numberFormatter
//try! csvWriter.write(to: targetLocation)

let sizes = (1...50).map { $0 * 60 }

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
