//
//  main.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

class RuntimeEvaluationManager<Data: InputData> {
    private let dataSize: Int
    private let runCount: Int

    private let algorithms: [SortingAlgorithm]
    private let inputData: [Data]

    init(dataSize: Int, runCount: Int, algorithms: [SortingAlgorithm], dataTypes: [Data]) {
        self.dataSize = dataSize
        self.runCount = runCount
        self.algorithms = algorithms
        self.inputData = dataTypes
    }

    private func evaluatePerformance(forInput data: [Data.Element]) -> [TimeInterval] {
        return algorithms.map { algorithm in
            let (resultData, duration) = measureRuntime(of: algorithm.sort(data))
            assert(resultData.isSorted(), "\(algorithm.name) failed to produce expected output data.")
            return duration
        }
    }
}

let algorithms = [BubbleSort()]
let dataTypes = [SortedData()]
let rem = RuntimeEvaluationManager(dataSize: 50, runCount: 500, algorithms: algorithms, dataTypes: dataTypes)
