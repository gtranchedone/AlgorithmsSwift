/*:
[Previous](@previous)
# Find the k largest elements in a BST
### Write a program that takes as input a BST and an integer k, and returns the k largest elements in the BST in decreasing order.
*/

func largestElements(root: BinaryNode<Int>, k: Int) -> [Int] {
    var array = [Int]()
    largestElements(root, k, &array)
    return array
}

func largestElements(root: BinaryNode<Int>?, _ k: Int, inout _ A: [Int]) {
    guard root != nil && A.count < k else { return }
    if let right = root?.right { largestElements(right, k, &A) }
    if A.count < k { A.append(root!.value) }
    if let left = root?.left { largestElements(left, k, &A) }
}

/*
                    5
           /                \
        3                     9
     /     \               /     \
  1          4          7           10
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

largestElements(node05, k: 3)
largestElements(node05, k: 5)
largestElements(node05, k: 10)
largestElements(node05, k: 20)

//: [Next](@next)
