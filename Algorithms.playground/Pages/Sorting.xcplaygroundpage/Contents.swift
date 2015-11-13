//:
//: # Sort Algorithms and exercises with Arrays
//:
//: ## Overview
//: TODO: add a table with running time and properties of all the algorithms below.

import Foundation

//: Let's define an unsorted array of Ints that will be used to execute all sorting algorithms explained in this page.
let unsortedArray = [4, 5, 3, 1, 2, 9, 7, 8, 6, 0]

//: ## Bubble Sort

extension _ArrayType where Generator.Element: Comparable {
    
    mutating func bubbleSortInPlace() {
        for i in 0..<count {
            for j in 0..<count {
                if self[i] < self[j] {
                    exchangeItemAtIndex(i, withItemAtIndex: j)
                }
            }
        }
    }
    
    func bubbleSort() -> Self {
        var sortedArray = self
        sortedArray.bubbleSortInPlace()
        return sortedArray
    }
    
}

let arrayOfOptionals = [AnyObject?]()

print("Bubble Sort \(unsortedArray.bubbleSort())", terminator: "")

//: ## Selection Sort

extension _ArrayType where Generator.Element: Comparable {
    
    mutating func selectionSortInPlace() {
        guard count > 1 else { return }
        for i in 0 ..< (count - 1) {
            var min = i
            for j in (i + 1) ..< count {
                if self[j] < self[min] {
                    min = j
                }
            }
            if min != i {
                exchangeItemAtIndex(i, withItemAtIndex: min)
            }
        }
    }
    
    func selectionSort() -> Self {
        var sortedArray = self
        sortedArray.selectionSortInPlace()
        return sortedArray
    }
    
}

print("Selection Sort \(unsortedArray.selectionSort())", terminator: "")

//: ## Insertion Sort

extension _ArrayType where Generator.Element: Comparable {
    
    mutating func insertionSortInPlace() {
        for i in 0 ..< count {
            for (var j = i; j > 0; j--) {
                if self[j] < self[j-1] {
                    exchangeItemAtIndex(j, withItemAtIndex: j-1)
                }
            }
        }
    }
    
    func insertionSort() -> Self {
        var sortedArray = self
        sortedArray.insertionSortInPlace()
        return sortedArray
    }
    
}

print("Insertion Sort \(unsortedArray.insertionSort())", terminator: "")

//: ## Shell Sort

func shellSort<T: Comparable>(anArray: Array<T>) {
    
}

//: ## Quick Sort

func quickSort<T: Comparable>(anArray: Array<T>) {
    
}

//: ## Shuffle

func shuffle<T>(array: Array<T>) {
    
}

//: # Interview Questions

/*:
Given an array arr[] of n integers, construct a Product Array prod[] (of same size)
such that prod[i] is equal to the product of all the elements of arr[] except arr[i]
*/

extension _ArrayType where Generator.Element == Int {
    
    func multiplyAllOtherInts() -> Self {
        var products = Self(count: count, repeatedValue: 0)
        // Get the products below the current index
        var temp = 1;
        for var i = 0; i < count; ++i {
            products[i] = temp
            temp *= self[i]
        }
        
        // Get the products above the curent index
        temp = 1;
        for var i = count - 1; i >= 0; --i {
            products[i] *= temp
            temp *= self[i]
        }
        return products
    }
    
}

let input = [2, 5, 15, 7]
let expectedResult = [(5 * 15 * 7), (2 * 15 * 7), (2 * 5 * 7), (2 * 5 * 15)]
let result = input.multiplyAllOtherInts()

/*:
Given an array of Ints containing subarrays of Ints insteand of an Int in some location,
write an Iterator (a class conforming to a protocol that matches the Iterator interface in Java)
that returns all items in the array and it's sublevels in the right order.

E.g. Given the array [2, 5, [15, 25, 30], 7], the expected result of calling next() 6 times
would give back the sequence [2, 5, 15, 25, 30, 7] as a result.

Note: there can be multiple levels of inception.
*/

func flattenArrayContainingSubarrays(array: Array<AnyObject>) -> Array<AnyObject> {
    func flattenArrayContainingSubarrays(array: Array<AnyObject>, inout resultArray: Array<AnyObject>) {
        for i in 0..<array.count {
            let object = array[i]
            if let inceptionArray = object as? Array<AnyObject> {
                flattenArrayContainingSubarrays(inceptionArray, resultArray: &resultArray)
            }
            else {
                resultArray.append(object)
            }
        }
    }
    var resultingArray = Array<AnyObject>()
    flattenArrayContainingSubarrays(array, resultArray: &resultingArray)
    return resultingArray
}

protocol Iterator {
    
    func hasNext() -> Bool
    func next() -> AnyObject
    
}

class InceptionArrayIterator: Iterator {
    
    private let array: Array<AnyObject>
    private var currentIndex: Int = 0
    
    init(array: Array<AnyObject>) {
        self.array = flattenArrayContainingSubarrays(array)
    }
    
    func hasNext() -> Bool {
        return currentIndex < array.count
    }
    
    func next() -> AnyObject {
        return array[currentIndex++]
    }
    
}

// MARK: Tests

let exampleArray: Array<AnyObject> = [2, 5, [15, 25, [], 30, [60, 62, 63]], 7, [8]]
let flattenedArray = flattenArrayContainingSubarrays(exampleArray)
let iterator = InceptionArrayIterator(array: exampleArray)
var iterationResults = Array<AnyObject>()
while (iterator.hasNext()) {
    iterationResults.append(iterator.next() as AnyObject)
}
iterationResults

//: [Next](@next)
//:
