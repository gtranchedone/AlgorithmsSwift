/*: 
[Previous](@previous)
# Compute the k closest stars
### Consider a coordinate system for the Milky Way, in which Earth is at (0, 0, 0). Model stars as points, and assume distances are in light years. The Milky Way consists of approximately 1012 stars, and their coordinates are stored in a file. How would you compute the k stars closest to Earth?
*/

import Foundation

// O(N log k) time and O(k) space where k = maxItems
func computeClosestStars(maxItems: Int) -> [Star] {
    let maxPriorityQueue = PriorityQueue<Star>(type: .Max)
    while (hasMoreStars()) {
        maxPriorityQueue.enqueue(nextStar()!)
        if maxPriorityQueue.count > maxItems {
            maxPriorityQueue.dequeue() // remove farthest star
        }
    }
    var closestStars = [Star]() // no init with just a count in Swift
    while !maxPriorityQueue.isEmpty {
        // insert always at front as the order from queue will be
        // from farthest to closest
        closestStars.insert(maxPriorityQueue.dequeue()!, atIndex: 0)
    }
    return closestStars
}

func hasMoreStars() -> Bool {
    // implementation depends on NSInputStream
    return false
}

func nextStar() -> Star? {
    // implementation depends on NSInputStream
    return nil
}
struct Coordinate3D: Equatable {
    let x: Float
    let y: Float
    let z: Float
    init(_ x: Float, _ y: Float, _ z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
}

func ==(lhs: Coordinate3D, rhs: Coordinate3D) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
}

// for the sake of this exercise comparable will only be based
// on the distance from Earth (a.k.a. Cordinate(0, 0, 0)
struct Star: Comparable {
    let name: String
    let coordinate: Coordinate3D
}

func ==(lhs: Star, rhs: Star) -> Bool {
    return lhs.coordinate == rhs.coordinate
}

func < (lhs: Star, rhs: Star) -> Bool {
    let distanceFromOriginL = sqrt((lhs.coordinate.x ** 2) +
        (lhs.coordinate.y ** 2) +
        (lhs.coordinate.z ** 2))
    let distanceFromOriginR = sqrt((lhs.coordinate.x ** 2) +
        (lhs.coordinate.y ** 2) +
        (lhs.coordinate.z ** 2))
    return distanceFromOriginL < distanceFromOriginR
}

func > (lhs: Star, rhs: Star) -> Bool {
    return rhs < lhs
}

func >= (lhs: Star, rhs: Star) -> Bool {
    return (lhs > rhs || lhs == rhs)
}

func <= (lhs: Star, rhs: Star) -> Bool {
    return (lhs < rhs || lhs == rhs)
}

//: [Next](@next)
