
// TODO: make it more efficient by using internally a different data structure e.g. a hash table
// Sets test for equality, Bags for identicity
public struct Bag<T where T: AnyObject> {
    private var array = [T]() // should be a hash table
    public init() {}
    
    public mutating func insert(value: T) {
        array.append(value)
    }
    
    public func contains(value: T) -> Bool {
        for item in array {
            if item === value {
                return true
            }
        }
        return false
    }
    
}
