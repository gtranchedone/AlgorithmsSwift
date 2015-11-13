//: [Previous](@previous)

import Foundation

//: # Implement a Stack with a -max operation, which returns the max value in the stack

// The simplest solution is to implement the pop operation so that
// if the maxValue is popped the data structure updates the value in
// time proportional to O(n) by traversing all stored values
public class Stack<T where T: Comparable> {
    private var head: StackNode<T>?
    private(set) public var maxValue: T?
    
    public func push(value: T) {
        let node = StackNode(value: value)
        node.next = head
        head = node
        if let max = maxValue {
            if max < value { maxValue = max }
        }
    }
    
    public func pop() -> T? {
        let value = head?.value
        head = head?.next
        var node = head
        if value == maxValue {
            while node != nil {
                maxValue = max(maxValue!, node!.value)
                node = node?.next
            }
        }
        return value
    }
}

private class StackNode<T> {
    let value: T
    var next: StackNode<T>?
    init(value: T) { self.value = value }
}

// Another solution is to save the maximum value for each level
// in the stack by embedding it into the Node or using an extra array.
// This way the running time drops to O(1) for all operations
private class StackMaxNode<T> {
    let value: T
    let maxBelow: T?
    var next: StackMaxNode<T>?
    init(value: T, maxBelow: T?) {
        self.value = value
        self.maxBelow = maxBelow
    }
}

public class StackMax<T where T: Comparable> {
    private var head: StackMaxNode<T>?
    private(set) public var maxValue: T?
    
    public func push(value: T) {
        let node = StackMaxNode(value: value, maxBelow: maxValue)
        node.next = head
        head = node
        if let max = maxValue {
            if max < value { maxValue = max }
        }
    }
    
    public func pop() -> T? {
        let value = head?.value
        if value == maxValue {
            maxValue = head?.maxBelow
        }
        head = head?.next
        return value
    }
}

//: [Next](@next)
