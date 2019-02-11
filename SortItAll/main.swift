//
//  main.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

class RuntimeEvaluationManager<Element: Comparable> {
    private let dataSize: Int
    private let runCount: Int

    private let algorithms: [SortingAlgorithm]
    private let inputData: [InputData<Element>]

    init(dataSize: Int, runCount: Int, algorithms: [SortingAlgorithm], dataTypes: [InputData<Element>]) {
        self.dataSize = dataSize
        self.runCount = runCount
        self.algorithms = algorithms
        self.inputData = dataTypes
    }

    private func evaluatePerformance(forInput data: [Element]) -> [TimeInterval] {
        return algorithms.map { algorithm in
            var copy = data
            let duration = measureRuntime(of: algorithm.sort(&copy))
            assert(copy.isSorted(), "\(algorithm.name) failed to produce expected output data.")
            return duration
        }
    }

    func evaluate() {
        inputData.forEach { data in
            _ = evaluatePerformance(forInput: data.next(withSize: dataSize))
        }
    }
}

let algorithms: [SortingAlgorithm] = [BubbleSort(), SelectionSort(), InsertionSort(), MergeSort()]
let dataTypes: [InputData<Int>] = [ReverseSortedData(), SortedData(), RandomData()]
let rem = RuntimeEvaluationManager(dataSize: 500, runCount: 500, algorithms: algorithms, dataTypes: dataTypes)
rem.evaluate()
