
import Foundation
import Darwin

public extension _ArrayType {
    
    public mutating func exchangeItemAtIndex(firstIndex: Int, withItemAtIndex secondIndex: Int) {
        guard firstIndex != secondIndex else { return }
        swap(&self[firstIndex], &self[secondIndex])
    }
    
    public mutating func shuffle() {
        for i in 0 ..< count {
            let randomIndex = Int(arc4random_uniform(UInt32(i + 1)))
            exchangeItemAtIndex(i, withItemAtIndex: randomIndex)
        }
    }
    
}
