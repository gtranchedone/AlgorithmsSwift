//: [Previous](@previous)

/*:
### Given two NSRange values, write an algorithm that compares the two ranges and returns true if they intersects or false otherwise.
*/

import Foundation

extension NSRange {
    
    var lastPoint: Int {
        get {
            return location + length - 1
        }
    }
    
}

func NSRange(leftRange: NSRange, intersectsRange rightRange: NSRange) -> Bool {
    //: if any of the ranges have no locations the two ranges cannot intersect
    guard (leftRange.length > 0 && rightRange.length > 0) else { return false }
    //: if both ranges start from the same location and have lenght > 0 they must share at least one point and therefore intersect
    guard (leftRange.location != rightRange.location) else { return true }
    /*:
    if two ranges start from different locations and have lenght > 0 => one of the ranges starts before the other
    in that case, that range must end after or at the beginning of the other in order to intersect it
    */
    func range(range: NSRange, startsBeforeAndFinishesAfterOrAtStartOfRange otherRange: NSRange) -> Bool {
        return range.location < otherRange.location && range.lastPoint >= otherRange.location
    }
    return range(leftRange, startsBeforeAndFinishesAfterOrAtStartOfRange: rightRange) ||
           range(rightRange, startsBeforeAndFinishesAfterOrAtStartOfRange: leftRange)
    
}

// MARK: Tests

func main() {
    //: NOTE: I'm printing the result of each test in this function to make it inlined with the test case in the Playground
    //: ## a range with lenght 0 cannot intersect any other range as it doesn't contain any item
    print(testIfRange(NSMakeRange(0, 0), intersectsRange: NSMakeRange(0, 1)), separator: "", terminator: "")
    print(testIfRange(NSMakeRange(0, 1), intersectsRange: NSMakeRange(0, 0)), separator: "", terminator: "")
    print(testIfRange(NSMakeRange(5, 0), intersectsRange: NSMakeRange(3, 6)), separator: "", terminator: "")
    print(testIfRange(NSMakeRange(2, 1), intersectsRange: NSMakeRange(4, 0)), separator: "", terminator: "")
    
    //: ## two ranges with lenght > 0 that start from the same location intersect as they will have at least 1 position in common
    print(testIfRange(NSMakeRange(0, 1), intersectsRange: NSMakeRange(0, 1)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l   x
    //: r   x
    print(testIfRange(NSMakeRange(2, 1), intersectsRange: NSMakeRange(2, 1)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l         x
    //: r         x
    print(testIfRange(NSMakeRange(0, 1), intersectsRange: NSMakeRange(0, 2)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l   x
    //: r         x
    print(testIfRange(NSMakeRange(0, 5), intersectsRange: NSMakeRange(0, 3)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l                  x
    //: r            x
    print(testIfRange(NSMakeRange(1, 5), intersectsRange: NSMakeRange(1, 5)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l      x  x  x  x  x
    //: r      x  x  x  x  x
    
    //: ## two ranges with length > 0 that start from different locations intersect if they share at least one position
    //: ### the following shoudn't intersect
    print(testIfRange(NSMakeRange(0, 1), intersectsRange: NSMakeRange(1, 1)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l   x
    //: r      x
    print(testIfRange(NSMakeRange(1, 1), intersectsRange: NSMakeRange(0, 1)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l      x
    //: r   x
    print(testIfRange(NSMakeRange(5, 3), intersectsRange: NSMakeRange(1, 4)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l                  x  x  x
    //: r      x  x  x  x
    print(testIfRange(NSMakeRange(2, 5), intersectsRange: NSMakeRange(7, 3)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l         x  x  x  x  x
    //: r                        x  x  x
    
    //: ### but this two others should
    print(testIfRange(NSMakeRange(1, 6), intersectsRange: NSMakeRange(6, 2)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l      x  x  x  x  x  x
    //: r                     x  x
    print(testIfRange(NSMakeRange(1, 6), intersectsRange: NSMakeRange(6, 1)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l      x  x  x  x  x  x
    //: r                     x
    print(testIfRange(NSMakeRange(1, 6), intersectsRange: NSMakeRange(0, 3)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l      x  x  x  x  x  x
    //: r   x  x  x
    print(testIfRange(NSMakeRange(1, 6), intersectsRange: NSMakeRange(1, 1)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l      x  x  x  x  x  x
    //: r      x
    print(testIfRange(NSMakeRange(2, 3), intersectsRange: NSMakeRange(1, 5)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l         x  x  x
    //: r      x  x  x  x  x
    print(testIfRange(NSMakeRange(1, 5), intersectsRange: NSMakeRange(2, 3)), separator: "", terminator: "")
    //: -> -0 -1 -2 -3 -4 -5 -6 -7 -8 -9 -10
    //: l      x  x  x  x  x
    //: r         x  x  x
}

func testIfRange(leftRange: NSRange, intersectsRange rightRange: NSRange) -> String {
    let intersects = NSRange(leftRange, intersectsRange: rightRange)
    let intersectsString = "intersects"
    let doesNotIntersectString = "doesn't intersect"
    return "\(NSStringFromRange(leftRange)) \(intersects ? intersectsString : doesNotIntersectString) \(NSStringFromRange(rightRange))"
}

main()

//: [Next](@next)
