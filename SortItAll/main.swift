//
//  main.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

let algorithms: [SortingAlgorithm] = [BubbleSort(), SelectionSort(), InsertionSort(), MergeSort()]
let dataTypes: [InputData<Int>] = [SortedData(), RandomData(), ReverseSortedData()]

let rem = RuntimeEvaluationManager(dataSize: 1000, runCount: 20, algorithms: algorithms, dataTypes: dataTypes)
let durations = rem.evaluate()

let csvWriter = CSVWriter(columnNames: algorithms.map { $0.name }, rowNames: dataTypes.map { $0.name }, data: durations)
csvWriter.numberFormatter.minimumIntegerDigits = 1
csvWriter.numberFormatter.minimumFractionDigits = 8

let targetLocation = URL(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Downloads")
    .appendingPathComponent("sorting.csv")
try! csvWriter.write(to: targetLocation)

