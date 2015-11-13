//: [Previous](@previous)

import Foundation


public extension _ArrayType where Generator.Element: Comparable {
    
    public func quickSort() -> Self {
        var array = self
        array.quickSortInPlace()
        return array
    }
    
    public mutating func quickSortInPlace() {
        shuffle() // see ArrayUtils.swift
        quickSortFrom(0, to: count - 1)
    }
    
    private mutating func quickSortFrom(from: Int, to: Int) {
        guard to > from else { return }
        let partitionIndex = partitionFrom(from, to: to)
        quickSortFrom(from, to: partitionIndex - 1)
        quickSortFrom(partitionIndex + 1, to: to)
    }
    
    private mutating func partitionFrom(from: Int, to: Int) -> Int {
        var i = from, j = to + 1
        while true {
            while self[from] > self[++i] {
                if i == to { break }
            }
            while self[from] < self[--j] {
                if j == from { break }
            }
            if i >= j { break }
            exchangeItemAtIndex(i, withItemAtIndex: j)
        }
        exchangeItemAtIndex(from, withItemAtIndex: j)
        return j
    }
    
}

let unsortedArray = [4, 5, 3, 1, 2, 9, 7, 8, 6, 0]
unsortedArray.quickSort()

//: [Next](@next)
