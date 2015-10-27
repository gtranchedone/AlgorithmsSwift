//: Playground - noun: a place where people can play

import UIKit

// MARK: - Operations on Arrays

// MARK: Multiply all other Integers in an array
// Given an array arr[] of n integers, construct a Product Array prod[] (of same size) such that prod[i] is equal to the product of all the elements of arr[] except arr[i]

func multiplyAllOther(anArray: Array<Int>) -> Array<Int> {
    var products = Array<Int>(count: anArray.count, repeatedValue: 0)
    // Get the products below the current index
    var temp = 1;
    for (var i = 0; i < anArray.count; ++i) {
        products[i] = temp
        temp *= anArray[i]
    }
    
    // Get the products above the curent index
    temp = 1;
    for (var i = anArray.count - 1; i >= 0; --i) {
        products[i] *= temp
        temp *= anArray[i]
    }
    return products
}

let input = [2, 5, 15, 7]
let expectedResult = [(5 * 15 * 7), (2 * 15 * 7), (2 * 5 * 7), (2 * 5 * 15)]
let result = multiplyAllOther(input)

// MARK: - Binary Search Trees
// Validate Binary Search Tree

class Node {
    
    let value: Int
    let key: Int
    
    var left: Node?
    var right: Node?
    
    init(value: Int, key: Int) {
        self.value = value
        self.key = key
    }
    
}

class Tree {
    
    var root: Node?
    
    func setValue(value: Int, forKey key: Int) {
    }
    
}

class BinarySearchTree: Tree {
    
    override func setValue(value: Int, forKey key: Int) {
        root = setValue(value, forKey: key, toNode: root)
    }
    
    private func setValue(value: Int, forKey key: Int, toNode node: Node?) -> Node {
        if let node = node {
            if (key < node.key) {
                node.left = setValue(value, forKey: key, toNode: node.left)
            }
            else if (key > node.key) {
                node.right = setValue(value, forKey: key, toNode: node.right)
            }
            else {
                // TODO: Ignore for now. When a new value is set for an existing key we need to update the tree.
            }
            return node
        }
        else {
            return Node(value: value, key: key)
        }
    }
    
}

func isValidBinarySearchTree(tree: Tree) -> Bool {
    return isValidBST(tree.root, minValue: Int(-IntMax()), maxValue: Int(IntMax()))
}

func isValidBST(root: Node?, minValue: Int, maxValue: Int) -> Bool {
    if let rootNode = root {
        let isValidValue = rootNode.key > minValue && rootNode.key < maxValue
        return isValidValue && isValidBST(rootNode.left, minValue: minValue, maxValue: rootNode.key) && isValidBST(rootNode.right, minValue: rootNode.key, maxValue: maxValue)
    }
    else {
        return true
    }
}
