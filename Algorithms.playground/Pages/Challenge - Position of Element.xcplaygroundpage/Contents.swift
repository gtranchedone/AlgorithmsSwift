//: [Previous](@previous)

/*:
### Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order. There won't be duplicate values in the array.

For example:

- [1, 3, 5, 6] with target value 5 should return 2.
- [1, 3, 5, 6] with target value 2 should return 1.
- [1, 3, 5, 6] with target value 7 should return 4.
- [1, 3, 5, 6] with target value 0 should return 0.
*/

import Foundation

var sampleData = [1, 3, 5, 6]

func positionOfElement<T where T: Comparable>(element: T, array: [T]) -> Int {
    /*:
    The array is supposed to be sorted, so searching a value in it using a binary search is the most efficient way
    to determine whether the element is present in the array or what's the lowest index it could go into. O(logN)
    */
    return modifiedBinarySearch(array, target: element)
}

//: This binary search returns the last lowest index the element was supposed to be found into instead of the classic -1 or Int? in Swift
func modifiedBinarySearch<T where T: Comparable>(array: [T], target: T) -> Int {
    var min = 0
    var max = array.count - 1
    var guess = 0
    
    while (min <= max) {
        guess = Int(floor(Double(min + max) / 2.0))
        let guessedElement = array[guess]
        if guessedElement == target {
            return guess
        }
        else if (target > guessedElement) {
            min = guess + 1
        }
        else {
            max = guess - 1
        }
    }
    
    /*:
    If the element wasn't found, it might be that the returned index is occupied by an element greater then the target.
    In this case the element must be smaller then the next element (otherwise the binary search would have returned that index instead)
    and therefore it would fit in between the elements at guess and guess + 1, hence it would push the element at
    guess + 1, and occupy that position itself.
    In our case min == guess + 1 as it's set to that value by the while loop above before returning, therefore we can simply return min.
    */
    return min
}

assert(positionOfElement(5, array: sampleData) == 2)
assert(positionOfElement(2, array: sampleData) == 1)
assert(positionOfElement(7, array: sampleData) == 4)
assert(positionOfElement(0, array: sampleData) == 0)

//: [Next](@next)
