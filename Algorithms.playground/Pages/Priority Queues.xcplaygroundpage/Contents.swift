//: [Previous](@previous)
//: See implementation of PriorityQueue in the Playground's Sources folder

let items = [1, 4, 12, 2, 3, 4, 5, 11, 2, 5, 6, 7, 13, 15, 8, 9, 10, 14]
let maxPriorityQueue = PriorityQueue<Int>(type: .Max)
let minPriorityQueue = PriorityQueue<Int>(type: .Min)
for item in items {
    maxPriorityQueue.enqueue(item)
    minPriorityQueue.enqueue(item)
}

while !maxPriorityQueue.isEmpty {
    print(maxPriorityQueue.dequeue()!)
}

while !minPriorityQueue.isEmpty {
    minPriorityQueue.dequeue()
}

//: [Next](@next)
