public class ListNode<T where T: CustomStringConvertible>: AnyObject, CustomStringConvertible {
    public let value: T
    public var next: ListNode<T>?
    public var description: String {
        get {
            guard !hasCycle() else { return "Cyclic List" }
            var description = "\(value.description)"
            if let next = next { description += " -> \(next)" }
            return description
        }
    }
    
    public init(value: T) {
        self.value = value
    }
    
    private func hasCycle() -> Bool {
        var i: ListNode<T>? = self, j: ListNode<T>? = self
        while j?.next?.next != nil {
            i = i?.next
            j = j?.next?.next
            if i === j { // cycle detected
                // calculate cycle length
                var cycleLength = 0
                repeat {
                    cycleLength++
                    j = j?.next
                } while (i !== j)
                
                // find cycle start
                var cycleIterator: ListNode<T>? = self
                while cycleLength-- > 0 {
                    cycleIterator = cycleIterator?.next
                }
                
                var otherIterator: ListNode<T>? = self
                while cycleIterator !== otherIterator {
                    cycleIterator = cycleIterator?.next
                    otherIterator = otherIterator?.next
                }
                return true
            }
        }
        return false
    }
}

public class List<T where T: CustomStringConvertible>: CustomStringConvertible {
    public var head: ListNode<T>?
    public var length: Int {
        get {
            var total = 0
            var node = head
            while node != nil {
                total++
                node = node!.next
            }
            return total
        }
    }
    public var isEmpty: Bool {
        get {
            return head == nil
        }
    }
    public var description: String {
        get {
            return head?.description ?? "Empty List"
        }
    }
    
    public init(head: ListNode<T>) {
        self.head = head
    }
    
    public init(values: [T]? = nil) {
        if let values = values {
            var lastNode: ListNode<T>? = nil
            for value in values {
                let node = ListNode<T>(value: value)
                lastNode?.next = node
                lastNode = node
                if head == nil {
                    head = node
                }
            }
        }
    }
}
