//: [Previous](@previous)

import Foundation

func spiralOrderOfMatrix<T>(matrix: [[T]]) -> [T] {
    var result = [T]()
    let numberOfIterations = Int(ceil(Double(matrix.count) / 2.0))
    for var offset = 0; offset < numberOfIterations; offset++ {
        if offset == matrix.count - offset - 1 {
            result.append(matrix[offset][offset])
            continue
        }
        for var i = offset; i < matrix.count - offset; i++ {
            result.append(matrix[offset][i])
        }
        for var i = offset + 1; i < matrix.count - offset - 1; i++ {
            result.append(matrix[i][matrix.count - offset - 1])
        }
        for var i = matrix.count - offset - 1; i > offset; i-- {
            result.append(matrix[matrix.count - 1 - offset][i])
        }
        for var i = matrix.count - offset - 1; i > offset; i-- {
            result.append(matrix[i][offset])
        }
    }
    return result
}

spiralOrderOfMatrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
spiralOrderOfMatrix([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]])

//: [Next](@next)
