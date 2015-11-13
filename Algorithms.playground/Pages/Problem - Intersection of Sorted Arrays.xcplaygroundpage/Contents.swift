//: [Previous](@previous)

// take the smaller array and binary search for matches
// we can skip duplicates
// O(NlogM) where N = smaller array count, M = larger array count
func intersectionOfSortedArrays<T where T: Comparable>(array1: [T], _ array2: [T]) -> [T] {
    let arrayToIterate = array1.count < array2.count ? array1 : array2
    let otherArray = array1.count < array2.count ? array2 : array1
    var result = [T]()
    for i in 0 ..< arrayToIterate.count {
        let item = arrayToIterate[i]
        if i == 0 || item != arrayToIterate[i - 1] {
            if let _ = otherArray.binarySearch(item) {
                result.append(item)
            }
        }
    }
    return result
}

// a more efficient O(N+M) is to iterate both arrays at the same time
// and increment pointers to current object based on comparison
// this algorithm takes advantage of the arrays being sorted
func quickIntersectionOfSortedArrays<T where T: Comparable>(array1: [T], _ array2: [T]) -> [T] {
    let a1 = array1.count < array2.count ? array1 : array2
    let a2 = array1.count < array2.count ? array2 : array1
    var result = [T]()
    var i = 0, j = 0
    // iterate in a1 & a2 but skip duplicates of a1 (which is both)
    while i < a1.count && j < a2.count {
        if a1[i] < a2[j] {
            i++
        }
        else if (i == 0 || a1[i] != a1[i-1]) && a1[i] == a2[j] {
            result.append(a1[i++])
            j++
        }
        else { // a1[i] < a2[j] || a1[i] == a1[i-1]
            j++
        }
    }
    return result
}

extension _ArrayType where Generator.Element : Comparable {
    func binarySearch(target: Generator.Element) -> Int? {
        guard count > 0 else { return nil }
        var low = 0, high = count - 1
        while low <= high {
            let mid = low + ((high - low) / 2)
            if self[mid] < target {
                low = mid + 1
            }
            else if self[mid] == target {
                return mid
            }
            else {
                high = mid - 1
            }
        }
        return nil
    }
}

let a1 = [2, 3, 3, 5, 5, 6, 7, 7, 8, 12]
let a2 = [5, 5, 6, 8, 8, 9, 10, 10]
intersectionOfSortedArrays(a1, a2)
quickIntersectionOfSortedArrays(a1, a2)

//: [Next](@next)