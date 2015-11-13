//: [Previous](@previous)

// O(n) - v1
func isBST<T where T: Comparable>(root: BinaryNode<T>?) -> Bool {
    return isBST(root, min: nil, max: nil)
}

func isBST<T where T: Comparable>(root: BinaryNode<T>?, min: T?, max: T?) -> Bool {
    guard root != nil else { return true }
    guard min == nil || root!.value > min else { return false }
    guard max == nil || root!.value < max else { return false }
    if let left = root?.left {
        let satisfiesCondition = left.value <= root!.value
        let hasLeftBST = (satisfiesCondition &&
                          isBST(left, min: min, max: root!.value))
        guard hasLeftBST else { return false }
    }
    if let right = root?.right {
        let satisfiesCondition = right.value > root!.value
        let hasRightBST = (satisfiesCondition &&
                           isBST(right, min: root!.value, max: max))
        guard hasRightBST else { return false }
    }
    return true
}

// O(n) - v2
func inOrderTraversalIsBST<T where T: Comparable>(root: BinaryNode<T>?, lastValue: T? = nil) -> Bool {
    guard root != nil else { return true }
    let leftIsBST = inOrderTraversalIsBST(root?.left, lastValue: root?.value)
    let thisIsBST = lastValue == nil || root!.value <= lastValue
    return leftIsBST && thisIsBST && inOrderTraversalIsBST(root?.right, lastValue: lastValue)
}

// O(h) where h = height of Tree if the Binary Tree is not a BST, O(n) otherwise
// Uses BFS to find first violation of BST property if present
func quickIsBST<T where T: Comparable>(root: BinaryNode<T>) -> Bool {
    var queue = Queue<BSTQueueNode<T>>()
    queue.enqueue(BSTQueueNode(node: root, min: nil, max: nil))
    while !queue.isEmpty {
        let qNode = queue.dequeue()
        if let bNode = qNode.node {
            if ((qNode.min != nil && bNode.value < qNode.min) ||
                (qNode.max != nil && bNode.value > qNode.max)) {
                    return false
            }
            else {
                queue.enqueue(BSTQueueNode(node: bNode.left, min: qNode.min, max: bNode.value))
                queue.enqueue(BSTQueueNode(node: bNode.right, min: bNode.value, max: qNode.max))
            }
        }
    }
    return true
}

struct BSTQueueNode<T: Comparable>: CustomStringConvertible {
    let node: BinaryNode<T>?
    let min: T?
    let max: T?
    var description: String {
        get { return "value: \(node?.value), min: \(min), max: \(max)" }
    }
}

let node01 = BinaryNode(value: 1)
let node03 = BinaryNode(value: 3)
let node04 = BinaryNode(value: 4)
let node05 = BinaryNode(value: 5)
let node06 = BinaryNode(value: 6)
let node07 = BinaryNode(value: 7)
let node09 = BinaryNode(value: 9)
let node10 = BinaryNode(value: 10)
node05.left = node03
node05.right = node09
node03.left = node01
node03.right = node04
node09.left = node07
node09.right = node10
node07.left = node06
isBST(node05)
inOrderTraversalIsBST(node05)
quickIsBST(node05)

let node02 = BinaryNode(value: 2)
let node08 = BinaryNode(value: 8)
let node11 = BinaryNode(value: 11)
let node13 = BinaryNode(value: 13)
let node15 = BinaryNode(value: 15)
node11.left = node08
node11.right = node13
node08.left = node02
node08.right = node15
isBST(node11)
inOrderTraversalIsBST(node11)
quickIsBST(node11)

//: [Next](@next)
