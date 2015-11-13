//: [Previous](@previous)

func evenOddMerge(list: List<Int>) -> List<Int> {
    var oddStart: ListNode<Int>?
    var evenStart: ListNode<Int>?
    var evenEnd: ListNode<Int>?
    var oddEnd: ListNode<Int>?
    var head = list.head
    while head != nil {
        let next = head?.next
        if head!.value % 2 == 0 {
            evenEnd?.next = head
            evenEnd = head
            if evenStart == nil {
                evenStart = head
            }
        }
        else {
            oddEnd?.next = head
            oddEnd = head
            if oddStart == nil {
                oddStart = head
            }
        }
        head = next
    }
    list.head = evenStart
    evenEnd?.next = oddStart
    return list
}

let list = List<Int>(values: [0, 1, 2, 3, 4, 5])
let list2 = List<Int>(values: [1, 2, 3, 4, 5])
evenOddMerge(list)
evenOddMerge(list2)

//: [Next](@next)
