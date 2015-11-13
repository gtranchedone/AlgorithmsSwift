/*:
[Previous](@previous)

# Challenge - Tower of Hanoi
### Given a stack of N disks arranged from largest on the bottom to smallest on top placed on a rod, together with two empty rods, write a program that prints a sequence of moves and the total number of moves required to move the stack from the first rod to the last, where moves are allowed only if a smaller disk is placed on top of a larger disk.

For example, for 3 disks, the solution requires moving the disks 7 times:

1. Move disk from [1] to [3]
2. Move disk from [1] to [2]
3. Move disk from [3] to [2]
4. Move disk from [1] to [3]
5. Move disk from [2] to [1]
6. Move disk from [2] to [3]
7. Move disk from [1] to [3]
*/

func numberOfMovesToSolveTowerOfHanoi(disksCount disksCount: Int) -> Int {
    var count = 0
    var rod1 = Stack<Int>(name: "1")
    var rod2 = Stack<Int>(name: "2")
    var rod3 = Stack<Int>(name: "3")
    for i in 0 ..< disksCount {
        rod1.push(disksCount - i)
    }
    towerOfHanoi(disksToMove: disksCount, fromRod: &rod1, toRod: &rod3, useRod: &rod2, count: &count)
    return count
}

func towerOfHanoi(disksToMove disksToMove: Int, inout fromRod: Stack<Int>, inout toRod:Stack<Int>, inout useRod: Stack<Int>, inout count: Int) {
    if disksToMove > 0 {
        towerOfHanoi(disksToMove: disksToMove - 1, fromRod: &fromRod, toRod: &useRod, useRod: &toRod, count: &count)
        toRod.push(fromRod.pop())
        print("\(++count). Move disk from \(fromRod.name!) to \(toRod.name!)")
        towerOfHanoi(disksToMove: disksToMove - 1, fromRod: &useRod, toRod: &toRod, useRod: &fromRod, count: &count)
    }
}

assert(numberOfMovesToSolveTowerOfHanoi(disksCount: 0) == 0)
assert(numberOfMovesToSolveTowerOfHanoi(disksCount: 1) == 1)
assert(numberOfMovesToSolveTowerOfHanoi(disksCount: 2) == 3)
assert(numberOfMovesToSolveTowerOfHanoi(disksCount: 3) == 7)
assert(numberOfMovesToSolveTowerOfHanoi(disksCount: 4) == 15)

//: [Next](@next)