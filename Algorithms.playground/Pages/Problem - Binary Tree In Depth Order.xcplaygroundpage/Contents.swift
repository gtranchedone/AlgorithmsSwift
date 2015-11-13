//: [Previous](@previous)

func binaryNodesInDepthOrder<T>(root: BinaryNode<T>) -> [T] {
    var array = [T]()
    var queue = Queue<BinaryNode<T>>()
    queue.enqueue(root)
    while !queue.isEmpty {
        let node = queue.dequeue()
        array.append(node.value)
        if let left = node.left { queue.enqueue(left) }
        if let right = node.right { queue.enqueue(right) }
    }
    return array
}

let one = BinaryNode<Int>(value: 1)
let two = BinaryNode<Int>(value: 2)
let three = BinaryNode<Int>(value: 3)
let four = BinaryNode<Int>(value: 4)
let five = BinaryNode<Int>(value: 5)
let six = BinaryNode<Int>(value: 6)
let seven = BinaryNode<Int>(value: 7)
let eight = BinaryNode<Int>(value: 8)
let nine = BinaryNode<Int>(value: 9)
let ten = BinaryNode<Int>(value: 10)

one.left = two
one.right = three
two.left = four
two.right = five
three.left = six
three.right = seven
four.left = eight
four.right = nine
five.left = ten

binaryNodesInDepthOrder(one)

//: [Next](@next)
