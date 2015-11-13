/*:
[Previous](@previous)
# Test for cyclicity
### Although a linked list is supposed to be a sequence of nodes ending in null, it is possible to create a cycle in a linked list by assigning to the next field of a node a reference to an earlier one. Given a reference to the head of a list, how would you determine if the list contains a cycle? Write a program that returns null if a list doesn’t contain a cycle or the node starting the cycle otherwise.
*/

// O(n) time and space
func testForCyclicity<T>(head: ListNode<T>) -> ListNode<T>? {
    var currentNode: ListNode<T>? = head
    var bag = Bag<ListNode<T>>()
    while true {
        bag.insert(currentNode!)
        let nextNode = currentNode?.next
        if nextNode == nil || bag.contains(nextNode!) {
            return nextNode // cycle start or nil to indicate no cycle
        }
        currentNode = nextNode
    }
}

// O(n) time and O(1) space
func testForCyclicityEfficiently<T>(head: ListNode<T>) -> ListNode<T>? {
    var i: ListNode<T>? = head, j: ListNode<T>? = head
    while j?.next?.next != nil {
        i = i?.next
        j = j?.next?.next
        if i === j { // cycle detected
            // calculate cycle length
            var cycleLength = 0
            repeat {
                cycleLength++
                j = j?.next
            } while (i !== j)
            
            // find cycle start
            var cycleIterator: ListNode<T>? = head
            while cycleLength-- > 0 {
                cycleIterator = cycleIterator?.next
            }
            
            var otherIterator: ListNode<T>? = head
            while cycleIterator !== otherIterator {
                cycleIterator = cycleIterator?.next
                otherIterator = otherIterator?.next
            }
            return otherIterator
        }
    }
    return nil
}

let list = List<Int>(values: [1, 2, 3, 4])
list.head?.next?.next?.next?.next = list.head?.next
testForCyclicity(list.head!)?.value
testForCyclicityEfficiently(list.head!)?.value

let list2 = List<Int>(values: [1, 2, 3, 4])
testForCyclicity(list2.head!)
testForCyclicityEfficiently(list2.head!)

//: [Next](@next)
