/*:
 [Previous](@previous)
 # The Dutch National Flag Problem
 ### Write a program that takes an array A of length n and an index i such that all elements less than A[i] appear first followed by elements equal to A[i], followed by elements greater than A[i].
*/

/*
 Complexity: O(n)
 During partitioning we keep the following subsets:
 array[0, smaller] contains all elements < array[index]
 array[smaller, equal] contains all elements == array[index]
 array[equal, larger] contains all elements we haven’t visited yet
 array[larger, array.count - 1] contains all elements > array[index]
*/
func partition<T where T: Comparable>(inout array: [T], index: Int) {
    guard index < array.count else { return }
    let value = array[index]
    var smaller = 0, equal = 0, larger = array.count - 1
    while equal <= larger {
        if array[equal] < value {
            array.exchangeItemAtIndex(smaller++, withItemAtIndex: equal++)
        }
        else if array[equal] == value {
            equal++
        }
        else {
            array.exchangeItemAtIndex(equal, withItemAtIndex: larger--)
        }
    }
}

func partition<T where T: Comparable>(inout array: [T], value: T) {
    let index = array.indexOf(value)
    if let index = index {
        partition(&array, index: index)
    }
}

var array = [9, 8, 5, 3, 4, 1, 2, 6, 7, 0, 4, 1, 3, 5, 6]
partition(&array, value: 4)
partition(&array, value: 6)
partition(&array, value: 3)
partition(&array, value: 5)

//: [Next](@next)
