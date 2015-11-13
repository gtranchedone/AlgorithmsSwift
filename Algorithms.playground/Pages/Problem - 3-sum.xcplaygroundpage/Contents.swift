/*:
[Previous](@previous)
# The 3-sum problem
### Given an array A of n numbers, let t be a number and k an integer in [1, n]. Define A to k-create t if and only if there exists k indices (not necessarily distinct) such that the sum of the values stored at those indices equals t. Design an algorithm that takes as input an array A and a number t, and determines if A 3-creates t.
*/

public func intsArray(array: [Int], hasThreeSumFor target: Int) -> Bool {
    let sortedArray = array.sort()
    for i in sortedArray {
        if intsArray(sortedArray, hasTwoSumFor: target - i) {
            return true
        }
    }
    return false
}

private func intsArray(array: [Int], hasTwoSumFor target: Int) -> Bool {
    // requires sorted array
    var i = 0, j = array.count - 1
    while (i <= j) {
        if (array[i] + array[j] == target) {
            return true
        }
        if (array[i] + array[j] < target) {
            i++
        }
        else {
            j--
        }
    }
    return false
}

intsArray([3, 4, 5], hasThreeSumFor: 8)
intsArray([3, 4, 5], hasThreeSumFor: 12)
intsArray([3, 3, 3, 10, 12, 5, 7, 0], hasThreeSumFor: 12)
intsArray([3, 3, 3, 10, 12, 5, 7, 0], hasThreeSumFor: 99)
intsArray([1, 3, 5, 7, 9, 11, 13, 15], hasThreeSumFor: 30)

//: [Next](@next)
