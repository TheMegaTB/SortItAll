//
//  RuntimeEvaluationManager.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

class RuntimeEvaluationManager<Element: Comparable> {
    private let runCount: Int

    private let algorithms: [SortingAlgorithm]
    private let inputData: [InputData<Element>]

    init(runCount: Int, algorithms: [SortingAlgorithm], dataTypes: [InputData<Element>]) {
        self.runCount = runCount
        self.algorithms = algorithms
        self.inputData = dataTypes
    }

    private func evaluatePerformance(forInput data: [Element]) -> [TimeInterval] {
        return algorithms.map { algorithm in
//            print("\t\t\(algorithm.name)")
            var copy = data
            let duration = measureRuntime(of: algorithm.sort(&copy))
            assert(copy.isSorted(), "\(algorithm.name) failed to produce expected output data.")
            return duration
        }
    }

    private func evaluateAveragePerformance(forInput data: InputData<Element>, withSize dataSize: Int) -> [TimeInterval] {
        let cumulatedPerformance = (0..<runCount).reduce(Array(repeating: 0.0, count: algorithms.count)) { acc, i in
//            print("\tRun #\(i)")
            let performances = evaluatePerformance(forInput: data.next(withSize: dataSize))
            return acc.combinedWith(array: performances) { $0 + $1 }
        }

        return cumulatedPerformance.map { $0 / Double(runCount) }
    }

    func evaluate(withSize dataSize: Int) -> [[TimeInterval]] {
        return inputData.map { data in
//            print("Evaluating performance on InputSet \(data.name)")
            return evaluateAveragePerformance(forInput: data, withSize: dataSize)
        }
    }

    func evaluate(sizes: [Int], runnerCount: Int = 4) -> [[[TimeInterval]]] {
        let group = DispatchGroup()
        var processedSizes = 0
        var results: [[[TimeInterval]]] = Array(repeating: [], count: sizes.count)

        (0..<runnerCount).forEach { i in
            group.enter()
            DispatchQueue.global().async {
                var index = i

                while index < sizes.count {
                    let size = sizes[index]
                    processedSizes += 1

                    print("[\(processedSizes)/\(sizes.count)] Evaluating size \(size)")
                    results[index] = self.evaluate(withSize: size)

                    index += runnerCount
                }

                group.leave()
            }
        }

        group.wait()

        return results
    }
}
