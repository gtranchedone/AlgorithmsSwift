//: [Previous](@previous)

import Foundation

class BookCache {
    private var cache = [String : BookCacheQueueNode<BookCacheData>]()
    private let cacheQueue = BookCacheQueue<BookCacheData>()
    var maxSize: Int = 5
    
    func insertBookWithISBN(isbn: String, price: Double) {
        let data = BookCacheData(lastLookup: NSDate(), price: price, isbn: isbn)
        if let node = cache[isbn] {
            node.key = data
            cacheQueue.pushBack(node)
        }
        else {
            let node = BookCacheQueueNode<BookCacheData>(key: data)
            cacheQueue.enqueue(node)
            cache[isbn] = node
            if (cache.count > maxSize) { prune() }
        }
    }
    
    func priceForBookWithISBN(isbn: String) -> Double? {
        let node = cache[isbn]
        let book = node?.key
        if let book = book {
            insertBookWithISBN(isbn, price: book.price)
        }
        return book?.price
    }
    
    func removeBookWithISBN(isbn: String) {
        let node = cache[isbn]
        if let node = node {
            cacheQueue.remove(node)
            cache.removeValueForKey(isbn)
        }
    }
    
    func prune() {
        if let isbn = cacheQueue.dequeue()?.key.isbn {
            removeBookWithISBN(isbn)
        }
    }
}

class BookCacheQueue<T> {
    private var head: BookCacheQueueNode<T>? = nil
    private var tail: BookCacheQueueNode<T>? = nil
    
    func enqueue(node: BookCacheQueueNode<T>) {
        if head == nil { head = node }
        node.previous = tail
        tail?.next = node
        tail = node
    }
    
    func dequeue() -> BookCacheQueueNode<T>? {
        let node = head
        head = head?.next
        head?.previous = nil
        return node
    }
    
    func remove(node: BookCacheQueueNode<T>) {
        if node === head {
            head = node.next
        }
        if node === tail {
            tail = node.previous
        }
        
        let previous = node.previous
        let next = node.next
        previous?.next = next
        next?.previous = previous
        node.previous = nil
        node.next = nil
    }
    
    func pushBack(node: BookCacheQueueNode<T>) {
        head?.description
        guard node !== tail else { return }
        guard head != nil else {
            enqueue(node)
            return
        }
        if node === head {
            head = head?.next
        }
        let previous = node.previous
        previous?.description
        previous?.next = node.next
        node.next?.previous = previous
        node.previous = tail
        node.next = nil
        tail?.next = node
        tail = node
    }
}

private struct BookCacheData: CustomStringConvertible {
    let lastLookup: NSDate
    let price: Double
    let isbn: String
    var description: String {
        get { return "\(isbn)" }
    }
}

class BookCacheQueueNode<T>: AnyObject, CustomStringConvertible {
    var key: T
    private var next: BookCacheQueueNode<T>?
    private var previous: BookCacheQueueNode<T>?
    var description: String {
        get {
            var description = "\(key)"
            if let next = next {
                description += " -> \(next.description)"
            }
            return description
        }
    }
    init(key: T) { self.key = key }
}

let bookCache = BookCache()
bookCache.insertBookWithISBN("1", price: 10.0)
bookCache.insertBookWithISBN("2", price: 20.0)
bookCache.insertBookWithISBN("3", price: 30.0)
bookCache.insertBookWithISBN("4", price: 40.0)
bookCache.insertBookWithISBN("5", price: 50.0)
bookCache.insertBookWithISBN("6", price: 60.0)
bookCache.priceForBookWithISBN("6")
bookCache.priceForBookWithISBN("5")
bookCache.priceForBookWithISBN("3")
bookCache.priceForBookWithISBN("2")
bookCache.priceForBookWithISBN("4")
bookCache.priceForBookWithISBN("6")
bookCache.priceForBookWithISBN("1")
bookCache.insertBookWithISBN("7", price: 70.0)
bookCache.priceForBookWithISBN("5")
bookCache.cacheQueue.head

//: [Next](@next)
