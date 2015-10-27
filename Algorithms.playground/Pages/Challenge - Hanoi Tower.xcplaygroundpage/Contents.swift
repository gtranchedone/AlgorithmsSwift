//: [Previous](@previous)

import Foundation

/*:
### Given a stack of N disks arranged from largest on the bottom to smallest on top placed on a rod, together with two empty rods, write a program that finds the minimum number of moves required to move the stack from the first rod to the last one, where moves are allowed only if a smaller disk is placed on top of a larger disk.

For example, for 3 disks, the solution requires moving the disks 7 times:

1. Move disk from [1] to [3]
2. Move disk from [1] to [2]
3. Move disk from [3] to [2]
4. Move disk from [1] to [3]
5. Move disk from [2] to [1]
6. Move disk from [2] to [3]
7. Move disk from [1] to [3]
*/

func numberOfStepsToResolveHanoiTowerWithDisksCount(disksCount: Int) -> Int {
    guard disksCount > 1 else { return disksCount }
    var tower = buildTowerOfHanoiWithDisksCount(disksCount)
    var pole1 = [Int]()
    var pole2 = [Int]()
    var stepsCount = 0
    
    return stepsCount
}

func buildTowerOfHanoiWithDisksCount(disksCount: Int) -> [Int] {
    var tower = [Int]()
    for i in 0 ..< disksCount {
        tower[i] = i
    }
    return tower
}

assert(numberOfStepsToResolveHanoiTowerWithDisksCount(0) == 0)
assert(numberOfStepsToResolveHanoiTowerWithDisksCount(1) == 1)
assert(numberOfStepsToResolveHanoiTowerWithDisksCount(2) == 3)
assert(numberOfStepsToResolveHanoiTowerWithDisksCount(3) == 7)

//: [Next](@next)
