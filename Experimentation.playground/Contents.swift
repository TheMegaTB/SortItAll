import Cocoa

let data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let runners = 4

(0..<runners).forEach { i in
    print("-- Runner #\(i)")
    var index = i
    while index < data.count {
        print(index)
        index += runners
    }
}

//func sliceRanges<T>(for array: [T], sliceCount: Int) -> [Range<Int>] {
//    let sliceSize = array.count / sliceCount
//    var slices: [Range<Int>] = []
//
//    slices.append(0..<sliceSize)
//    for i in 1..<sliceCount-1 {
//        let slice = i*sliceSize..<sliceSize*(i+1)
//        slices.append(slice)
//    }
//    slices.append((sliceCount-1)*sliceSize ..< array.count)
//
//    return slices
//}
//
//print(sliceRanges(for: [1, 2, 3, 4, 5, 6], sliceCount: 3))
