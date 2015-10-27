//: [Previous](@previous) | [Next](@next)

import Foundation

public class BinaryNode<V, K: Comparable> : CustomStringConvertible {
    
    public let value: V
    public let key: K
    
    public var left: BinaryNode<V, K>?
    public var right: BinaryNode<V, K>?
    
    public init(value: V, key: K) {
        self.value = value
        self.key = key
    }
    
    public var description: String {
        get { return "\(BinaryNode.self) {key: \(key), value:\(value), left: \(left), right: \(right)}" }
    }
    
}

public class BinaryTree<V, K: Comparable> {
    
    var root: BinaryNode<V, K>?
    
    public func setValue(value: V, forKey key: K) {
    }
    
}

// MARK: - Binary Search Tree

public class BinarySearchTree<V, K: Comparable>: BinaryTree<V, K> {
    
    override public func setValue(value: V, forKey key: K) {
        root = setValue(value, forKey: key, toNode: root)
    }
    
    private func setValue(value: V, forKey key: K, toNode node: BinaryNode<V, K>?) -> BinaryNode<V, K> {
        if let node = node {
            let updatedNode = node
            if (key < node.key) {
                updatedNode.left = setValue(value, forKey: key, toNode: node.left)
            }
            else if (key > node.key) {
                updatedNode.right = setValue(value, forKey: key, toNode: node.right)
            }
            else {
                // TODO: Ignore for now. When a new value is set for an existing key we need to update the tree.
            }
            return updatedNode
        }
        else {
            return BinaryNode<V, K>(value: value, key: key)
        }
    }
    
}

//: # Interview Questions

//: Validate that a Tree is a Binary Search Tree

extension BinaryTree {
    
    func isBinarySearchTree() -> Bool {
        func isBinarySearchTree(subtreeRoot: BinaryNode<V, K>?, minValue: K?, maxValue: K?) -> Bool {
            func isKeyInValidRange(key: K, minValue: K?, maxValue: K?) -> Bool {
                // If no minValue nor maxValue is specified, the key needs to be considered valid.
                var isKeyInValidRange = true
                if let minValue = minValue {
                    isKeyInValidRange = key > minValue
                }
                if let maxValue = maxValue {
                    // The key is valid by default but if there's a minValue constraint we need to respect it.
                    // We do so by simply checking that the key is still valid when we hit this point.
                    // As a result we consider both the case where the minValue bound is present
                    // and when it's not (the key would be valid by default in that case)
                    isKeyInValidRange = isKeyInValidRange && key < maxValue
                }
                return isKeyInValidRange
            }
            
            if let subtreeRoot = subtreeRoot {
                let isKeyInValidRange = isKeyInValidRange(subtreeRoot.key, minValue: minValue, maxValue: maxValue)
                let checkLeft = { return isBinarySearchTree(subtreeRoot.left, minValue: minValue, maxValue: subtreeRoot.key) }
                let checkRight = { return isBinarySearchTree(subtreeRoot.right, minValue: subtreeRoot.key, maxValue: maxValue) }
                // NOTE: having checkLeft and checkRight as closures is an optimization that prevents the recursions
                // on both the left and right subtrees to be executed if the tree is already known not to be a Binary Search Tree.
                // This can save a lot when performing the operation on large trees.
                return isKeyInValidRange && checkLeft() && checkRight()
            }
            else {
                return true
            }
        }
        return isBinarySearchTree(root, minValue: nil, maxValue: nil)
    }
    
}

// Test Validate Binary Search Tree

func testGenericTreeIsNotBinaryIfNodesAreNotInTheRightOrder() {
    let tree = BinaryTree<String, Int>()
    tree.root = BinaryNode(value: "Root", key: 2)
    tree.root?.left = BinaryNode(value: "Left", key: 3)
    tree.root?.right = BinaryNode(value: "Right", key: 1)
    let isBST = tree.isBinarySearchTree()
    assert(!isBST, "The test Tree is not a BST but the check passes")
    print("Non-BST is BST: \(isBST)", appendNewline: false)
}

func testGenericTreeIsBinaryIfNodesAreInTheRightOrder() {
    let tree = BinaryTree<String, Int>()
    tree.root = BinaryNode(value: "Root", key: 2)
    tree.root?.left = BinaryNode(value: "Left", key: 1)
    tree.root?.right = BinaryNode(value: "Right", key: 3)
    let isBST = tree.isBinarySearchTree()
    assert(isBST, "The test Tree is a BST but the check fails")
    print("Tree with BST nodes is BST: \(isBST)", appendNewline: false)
}

func testBinarySearchTreeIsCorrectlyConstructed() {
    let tree = BinarySearchTree<String, Int>()
    tree.setValue("Root", forKey: 2)
    tree.setValue("Right", forKey: 3)
    tree.setValue("Left", forKey: 1)
    let isBST = tree.isBinarySearchTree()
    assert(isBST, "The test for a Binary Search Tree to be indeed a Binary Search Tree fails")
    print("Tree with BST nodes is BST: \(isBST)", appendNewline: false)
}

testGenericTreeIsNotBinaryIfNodesAreNotInTheRightOrder()
testGenericTreeIsBinaryIfNodesAreInTheRightOrder()
testBinarySearchTreeIsCorrectlyConstructed()

//: [Previous](@previous) | [Next](@next)
