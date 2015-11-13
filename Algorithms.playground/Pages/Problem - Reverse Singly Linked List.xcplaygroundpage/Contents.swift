//: [Previous](@previous)

func reverseLinkedList<T>(list: List<T>) {
    guard list.head != nil else { return }
    let head = list.head!
    var newHead = head
    while head.next != nil {
        let nextNode = head.next!
        head.next = nextNode.next
        nextNode.next = newHead
        newHead = nextNode
    }
    list.head = newHead
}

let list = List<Int>(values: [1, 2, 3, 4])
reverseLinkedList(list)
list

//: [Next](@next)
