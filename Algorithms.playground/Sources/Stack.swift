
public struct Stack<T> : CustomStringConvertible {
    
    private var items = Array<T>()
    
    public let name: String?
    public var count: Int {
        get { return items.count }
    }
    public var isEmpty: Bool {
        get { return items.count == 0 }
    }
    
    public init(name: String? = nil) {
        self.name = name
    }
    
    /// @abstract Adds an element on the stack
    public mutating func push(item: T) {
        items.append(item)
    }
    
    /// @abstract Removes the last element from the stack. A Stack operates in First In Last Out order.
    public mutating func pop() -> T {
        return items.removeLast()
    }
    
    /// @return Returns the last element added to the stack or nil if the stack is empty.
    public func peek() -> T? {
        return items.last
    }
    
    public var description: String {
        get {
            return items.description
        }
    }
    
}
