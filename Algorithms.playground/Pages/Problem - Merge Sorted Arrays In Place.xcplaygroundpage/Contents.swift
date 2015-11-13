//: [Previous](@previous)

func mergeInPlace(inout a1: [Int], var a2: [Int], largestCount: Int) {
    if a1.count < a2.count { swap(&a1, &a2) }
    var n1 = largestCount, n2 = a2.count
    while n2 > 0 {
        let index = n1 + n2 - 1
        if a1[n1 - 1] < a2[n2 - 1] {
            a1[index] = a2[--n2]
        }
        else {
            a1[index] = a1[--n1]
        }
    }
}

// tailing 0s represent empty spaces
var a1 = [1, 2, 4, 6, 8, 0, 0, 0, 0]
var a2 = [3, 5, 7]
mergeInPlace(&a1, a2: a2, largestCount: 5)

//: [Next](@next)