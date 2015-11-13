/*:
[Previous](@previous)
# Sample offline data
### Let A be an array whose entries are all distinct. Implement an algorithm that takes A and an integer k as input and returns a subset of k elements in A. All subsets should be equally likely to be returned.
*/

/* My interpretation of the problem is that the result should be a uniformly random array containing the first k items. Correct me if I'm wrong. */
func sampleDataFrom<T>(array: [T], maxElements: Int) -> [T] {
    var result = array
    result.shuffle()
    return Array(result.prefixUpTo(maxElements))
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sampleDataFrom(array, maxElements: 3)

//: [Next](@next)
