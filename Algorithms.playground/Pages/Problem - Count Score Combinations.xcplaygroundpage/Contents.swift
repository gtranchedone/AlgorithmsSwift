//: [Previous](@previous)

func countScoreCombinationsForScore(totalScore: Int, possiblePoints: Set<Int>) -> Int {
    var combinations = [CLong](count: totalScore + 1, repeatedValue: 0)
    combinations[0] = 1; // One way to reach 0.
    for point in possiblePoints {
        for var j = point; j <= totalScore; j++ {
            combinations[j] += combinations[j - point];
        }
    }
    return combinations[totalScore];
}

let possiblePoints = Set<Int>(arrayLiteral: 2, 3, 7)
countScoreCombinationsForScore(0, possiblePoints: possiblePoints)   // <- 1
countScoreCombinationsForScore(5, possiblePoints: possiblePoints)   // <- 1
countScoreCombinationsForScore(9, possiblePoints: possiblePoints)   // <- 3
countScoreCombinationsForScore(12, possiblePoints: possiblePoints)  // <- 4
countScoreCombinationsForScore(14, possiblePoints: possiblePoints)  // <- 5

//: [Next](@next)
