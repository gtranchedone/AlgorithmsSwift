/*: [Previous](@previous)
# Search a sorted array for first  occurrence of k
### Write a method that takes a sorted array and a key and returns the index of the first occurrence of that key in the array. For example, in the array [-14, -10, 2, 108, 108, 243, 285, 285, 285, 401], when searching for 108, the algorithm should return the index 3 and when searching for 285 it should return index 6.
*/

// use binary search but don’t stop when the first element is found
func indexOfFirstOccurrenceOf<T where T: Comparable>(element: T, inArray array: [T]) -> Int? {
    guard !array.isEmpty else { return nil }
    var low = 0, high = array.count - 1, result: Int? = nil
    while (low <= high) {
        let mid = low + ((high - low) / 2)
        if array[mid] <= element {
            high = mid - 1
            if array[mid] == element {
                result = mid // this is always the lowest match found
            }
        }
        else {
            low = mid + 1
        }
    }
    return result
}

let array = [-14, -10, 2, 108, 108, 243, 285, 285, 285, 401]
array.indexOf(99)
array.indexOf(108)
array.indexOf(285)

let emptyArray: [Int] = []
emptyArray.indexOf(123)

//: [Next](@next)