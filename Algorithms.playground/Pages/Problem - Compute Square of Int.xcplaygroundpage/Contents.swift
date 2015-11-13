//: [Previous](@previous)

func computeIntegerSquareRoot(k: Int) -> Int {
    var low = 0, high = k
    while low <= high {
        let mid = low + ((high - low) / 2)
        if (mid * mid) > k {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    // minus one because if k is not a pefect square low will be set last when low ** 2 < k to (low + 1) ** 2 > k
    return low - 1
}

computeIntegerSquareRoot(4)
computeIntegerSquareRoot(21)
computeIntegerSquareRoot(25)
computeIntegerSquareRoot(300)

//: [Next](@next)
