//: [Previous](@previous)

// O(h) time where h is the height of the tree and O(1) space
// A brute force algorithm would take O(n) time and space instead
func lca<T>(node1: FullBinaryNode<T>, node2: FullBinaryNode<T>) -> FullBinaryNode<T> {
    // move up from the lowest level to the other
    var h1 = node1.depth, h2 = node2.depth
    var n1: FullBinaryNode<T>? = node1
    var n2: FullBinaryNode<T>? = node2
    while h1 != h2 {
        if h1 > h2 {
            h1--
            n1 = n1?.parent
        }
        else {
            h2--
            n2 = n2?.parent
        }
    }
    // lowest common ancestor now is easy to get
    while n1 !== n2 {
        n1 = n1?.parent
        n2 = n2?.parent
    }
    return n1!
}

let one = FullBinaryNode<Int>(value: 1)
let two = FullBinaryNode<Int>(value: 2)
let three = FullBinaryNode<Int>(value: 3)
let four = FullBinaryNode<Int>(value: 4)
let five = FullBinaryNode<Int>(value: 5)
let six = FullBinaryNode<Int>(value: 6)
let seven = FullBinaryNode<Int>(value: 7)
let eight = FullBinaryNode<Int>(value: 8)
let nine = FullBinaryNode<Int>(value: 9)
let ten = FullBinaryNode<Int>(value: 10)

one.left = two
one.right = three
two.left = four
two.right = five
three.left = six
three.right = seven
four.left = eight
four.right = nine
five.left = ten

lca(nine, node2: five).value
lca(two, node2: three).value
lca(ten, node2: six).value
lca(six, node2: seven).value
lca(eight, node2: seven).value

//: [Next](@next)
