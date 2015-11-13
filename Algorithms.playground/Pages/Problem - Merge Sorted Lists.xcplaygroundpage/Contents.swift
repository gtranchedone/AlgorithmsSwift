//: [Previous](@previous)

// O(N) where N is max(L.count, F.count)
func mergeList(lhs: List<Int>, withList rhs: List<Int>) -> List<Int> {
    var lNode = lhs.head
    var rNode = rhs.head
    let result = List<Int>()
    var currentNode: ListNode<Int>? = nil
    
    while (lNode != nil && rNode != nil) {
        // capture smaller node and advance pointer in correct list
        let nextNode: ListNode<Int>?
        if lNode!.value < rNode!.value {
            nextNode = lNode
            lNode = lNode?.next
        }
        else {
            nextNode = rNode
            rNode = rNode?.next
        }
        
        // set head of list to return if needed
        if result.head == nil {
            result.head = nextNode
        }
        currentNode?.next = nextNode
        currentNode = nextNode
    }
    // attach orphaned list if any
    currentNode?.next = lNode ?? rNode
    return result
}

let list1 = List<Int>(values: [1, 3, 5, 5])
let list2 = List<Int>(values: [2, 4, 6])
mergeList(list1, withList: list2)

//: [Next](@next)
