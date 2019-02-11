//
//  RuntimeEvaluationManager.swift
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
            print("\t\t\(algorithm.name)")
            let (resultData, duration) = measureRuntime(of: algorithm.sort(data))
            assert(resultData.isSorted(), "\(algorithm.name) failed to produce expected output data.")
            return duration
        }
    }

    private func evaluateAveragePerformance(forInput data: Data) -> [TimeInterval] {
        let cumulatedPerformance = (0..<runCount).reduce(Array(repeating: 0.0, count: algorithms.count)) { acc, i in
            print("\tRun #\(i)")
            let performances = evaluatePerformance(forInput: data.next(withSize: dataSize))
            return acc.combinedWith(array: performances) { $0 + $1 }
        }

        return cumulatedPerformance.map { $0 / Double(runCount) }
    }

    func evaluate() -> [[TimeInterval]] {
        return inputData.map { data in
            print("Evaluating performance on InputSet \(data.name)")
            return evaluateAveragePerformance(forInput: data)
        }
    }
}
