//: [Previous](@previous)

func isBinaryTreeBalanced<T>(root: BinaryNode<T>) -> Bool {
    var height = 0 // inout parameters in Swift cannot be optional
    return isBinaryTreeBalanced(root, height: &height)
}

func isBinaryTreeBalanced<T>(root: BinaryNode<T>?, inout height: Int) -> Bool {
    guard root != nil else {
        height = 0
        return true
    }
    var hLeft = 0, hRight = 0
    let balancedLeft = isBinaryTreeBalanced(root!.left, height: &hLeft)
    let balancedRight = isBinaryTreeBalanced(root!.right, height: &hRight)
    height = 1 + max(hLeft, hRight)
    let isBalanced = !(hLeft > hRight + 1 || hRight > hLeft + 1)
    return isBalanced && balancedLeft && balancedRight
}

class BinaryNode<T> {
    let value: T
    var left: BinaryNode<T>?
    var right: BinaryNode<T>?
    init(value: T) { self.value = value }
}

let n1 = BinaryNode(value: 1)
isBinaryTreeBalanced(n1)

let n2 = BinaryNode(value: 2)
n1.left = n2
isBinaryTreeBalanced(n1)

let n3 = BinaryNode(value: 3)
n1.right = n3
isBinaryTreeBalanced(n1)

let n4 = BinaryNode(value: 4)
n2.left = n4
isBinaryTreeBalanced(n1)

let n5 = BinaryNode(value: 5)
n4.left = n5
isBinaryTreeBalanced(n1)

//: [Next](@next)
