//:
//: [Previous](@previous)

//: # Stacks
//:
//: A stack is a First-In-Last-Out (FILO) collection type.
//: Stacks are found in everyday life, for example, as a card deck, or as a pile of letters you need to read.
//: The last item added to the stack is the first one to come out of it.
//:
//: NOTE: We could have Stack implement the CollectionType protocol,
//: but that has dependencies on it's own that we don't want for now.
//: We will, however, adopt the same interface as CollectionType as if it extended no other protocol.

public struct Stack<T> : CustomStringConvertible {
    
    private var items = Array<T>()
    
    public var count: Int {
        get {
            return items.count
        }
    }
    
    public var isEmpty: Bool {
        get {
            return items.count == 0
        }
    }
    
    public mutating func push(item: T) {
        items.append(item)
    }
    
    public mutating func pop() -> T {
        return items.removeLast()
    }
    
    public var description: String {
        get {
            return items.description
        }
    }
    
}

var stack = Stack<Int>()
stack.isEmpty
stack.push(1)
stack.push(2)
stack.push(3)
stack.pop()
stack.isEmpty
stack

var stack2 = Stack<Int?>()
stack2.push(1)
stack2.push(nil)

//: [Next](@next)
