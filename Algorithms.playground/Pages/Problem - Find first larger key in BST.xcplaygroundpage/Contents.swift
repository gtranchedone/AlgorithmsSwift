/*:
[Previous](@previous)
# Find the first key larger than a given value in a BST
### Write a program that takes as input a BST and a value, and returns the first key that would appear in an inorder traversal which is greater than the input value.
*/

func findLargerThan(k: Int, root: BinaryNode<Int>) -> Int? {
    var result: Int? = nil
    var currentNode: BinaryNode<Int>? = root
    while currentNode != nil {
        if currentNode?.value == k {
            if currentNode?.right?.value > k {
                return currentNode?.right?.value
            }
            break // return max found so far
        }
        else if currentNode?.value > k {
            result = currentNode?.value
            currentNode = currentNode?.left
        }
        else {
            currentNode = currentNode?.right
        }
    }
    return result
}

/*
                  5
           /             \
        3                   9
     /     \             /     \
  1          4        7           10
                    /
                  6
*/


let node01 = BinaryNode<Int>(value: 1)
let node03 = BinaryNode<Int>(value: 3)
let node04 = BinaryNode<Int>(value: 4)
let node05 = BinaryNode<Int>(value: 5)
let node06 = BinaryNode<Int>(value: 6)
let node07 = BinaryNode<Int>(value: 7)
let node09 = BinaryNode<Int>(value: 9)
let node10 = BinaryNode<Int>(value: 10)
node05.left = node03
node05.right = node09
node03.left = node01
node03.right = node04
node09.left = node07
node09.right = node10
node07.left = node06

findLargerThan(7, root: node05)
findLargerThan(3, root: node05)
findLargerThan(5, root: node05)
findLargerThan(1, root: node05)
findLargerThan(6, root: node05)
findLargerThan(4, root: node05)
findLargerThan(9, root: node05)
findLargerThan(10, root: node05)

//: [Next](@next)
