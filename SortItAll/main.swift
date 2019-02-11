//
//  main.swift
//  SortItAll
//
//  Created by Til Blechschmidt on 11.02.19.
//  Copyright © 2019 Til Blechschmidt. All rights reserved.
//

import Foundation

let arrayLength = 10

let sortedArray = Array((0...arrayLength))
let reverseSortedArray = Array(sortedArray.reversed())
let randomArray = Array(sortedArray.shuffled())

measureRuntime(of: reverseSortedArray.sorted(with: BogoSort()))
