
private class PriorityQueueItem<T where T: Comparable> : Comparable {
    let item: T?
    init(item: T?) { self.item = item }
}

private func == <T: Comparable>(lhs: PriorityQueueItem<T>, rhs: PriorityQueueItem<T>) -> Bool { return lhs.item == rhs.item }
private func < <T: Comparable>(lhs: PriorityQueueItem<T>, rhs: PriorityQueueItem<T>) -> Bool { return lhs.item < rhs.item }
private func <= <T: Comparable>(lhs: PriorityQueueItem<T>, rhs: PriorityQueueItem<T>) -> Bool { return lhs.item <= rhs.item }
private func >= <T: Comparable>(lhs: PriorityQueueItem<T>, rhs: PriorityQueueItem<T>) -> Bool { return lhs.item >= rhs.item }
private func > <T: Comparable>(lhs: PriorityQueueItem<T>, rhs: PriorityQueueItem<T>) -> Bool { return lhs.item > rhs.item }

public enum PriorityQueueType {
    case Min
    case Max
}

public class PriorityQueue<T where T: Comparable> {
    
    private var items = [PriorityQueueItem<T>]()
    public var isEmpty: Bool {
        get { return items.count == 1 /* see init */ }
    }
    public var count: Int {
        get { return items.count - 1 /* see init */ }
    }
    public let type: PriorityQueueType
    
    public init(type: PriorityQueueType = .Max) {
        // items needs to start from index 1 to do correct math
        // for sink and swim operations
        self.type = type
        items.append(PriorityQueueItem<T>(item: nil))
    }
    
    public func enqueue(item: T) {
        items.append(PriorityQueueItem<T>(item: item))
        swimItemAtIndex(count)
    }
    
    public func dequeue() -> T? {
        guard !isEmpty else { return nil }
        exchange(1, count)
        let item = items.removeLast().item
        sinkItemAtIndex(1)
        return item
    }
    
    // returns true if lhs has higher priority than rhs
    private func compare(lhs: Int, _ rhs: Int) -> Bool {
        if type == .Min {
            return items[lhs] < items[rhs]
        }
        return items[lhs] > items[rhs]
    }
    
    private func exchange(lhs: Int, _ rhs: Int) {
        if lhs != rhs { swap(&items[lhs], &items[rhs]) }
    }
    
    // move item at index up the heap as long as necessary
    private func swimItemAtIndex(index: Int) {
        // compare item at index with parent recursively and
        // exchange them if necessary until item is in place
        var k = index
        while (k / 2) > 0 && compare(k, k / 2) {
            exchange(k, k / 2)
            k = k / 2
        }
    }
    
    // move item at index down the heap as long as necessary
    private func sinkItemAtIndex(index: Int) {
        // compare item with children recursively and
        // exchange them if necessary until item is in place
        var k = index
        while (k * 2) <= count {
            // only consider the highest priority child
            var j = k * 2
            if j < count && !compare(j, j + 1) { j++ }
            if compare(k, j) { break }
            exchange(k, j)
            k = j
        }
    }
    
}
