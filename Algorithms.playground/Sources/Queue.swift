//: # Queues
//:
//: Queues are a First-In-First-Out (FIFO) collection type.
//: You can find queues in everyday life when you go to a supermarket, or to the post office.
//: It's usually considered fair that the first to come is also the first to be served.
//: Queues, therefore, represent a collection where items are _enqueued_ one after the other
//: and when requesting an item in the queue, the one that has been enqueued the longest is _dequeued_.
//:
//: NOTE: We could have Stack implement the CollectionType protocol,
//: but that has dependencies on it's own that we don't want for now.
//: We will, however, adopt the same interface as CollectionType as if it extended no other protocol.

public struct Queue<T> : CustomStringConvertible {
    
    private var items = Array<T>()
    public init() {}
    
    public var count: Int {
        get { return items.count }
    }
    
    public var isEmpty: Bool {
        get { return count == 0 }
    }
    
    public mutating func enqueue(item: T) {
        items.append(item)
    }
    
    public mutating func dequeue() -> T {
        return items.removeFirst()
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        get { return items.description }
    }
    
}