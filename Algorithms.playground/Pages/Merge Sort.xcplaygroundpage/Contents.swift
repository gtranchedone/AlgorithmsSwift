//: [Previous](@previous)

import Foundation

public extension _ArrayType where Generator.Element: Comparable {
    
    public func mergeSort() -> Self {
        var array = self
        array.mergeSortInPlace()
        return array
    }
    
    public mutating func mergeSortInPlace() {
        self.mergeSortFrom(0, to: count - 1)
    }
    
    private mutating func mergeSortFrom(low: Int, to high: Int) {
        guard high > low else { return }
        let mid = low + (high - low) / 2
        mergeSortFrom(low, to: mid)
        mergeSortFrom(mid + 1, to: high)
        mergeFrom(low, to: high)
    }
    
    private mutating func mergeFrom(low: Int, to high: Int) {
        let mid = low + (high - low) / 2
        let aux = self // in Swift the copy is shallow unless needed
        var i = low, j = mid + 1
        for k in low ... high {
            if i > mid {
                self[k] = aux[j++]
            }
            else if j > high {
                self[k] = aux[i++]
            }
            else if aux[i] < aux[j] {
                self[k] = aux[i++]
            }
            else {
                self[k] = aux[j++]
            }
        }
    }
    
}

let unsortedArray = [4, 5, 3, 1, 2, 9, 7, 8, 6, 0]
unsortedArray.mergeSort()

//: [Next](@next)