//:
//: [Previous](@previous)
//:
//: # Stacks
//:
//: A stack is a First-In-Last-Out (FILO) collection type.
//: Stacks are found in everyday life, for example, as a card deck, or as a pile of letters you need to read.
//: The last item added to the stack is the first one to come out of it.
//:
//: NOTE: We could have Stack implement the CollectionType protocol,
//: but that has dependencies on it's own that we don't want for now.
//: We will, however, adopt the same interface as CollectionType as if it extended no other protocol.
//:
//: **See Stack.swift in the Playground's shared Sources for the implementation of a stack.**

var stack = Stack<Int>()
stack.isEmpty
stack.push(1)
stack.push(2)
stack.push(3)
stack.pop()
stack
stack.isEmpty
stack.peek()

var stack2 = Stack<Int?>()
stack2.push(1)
stack2.push(nil)

//: [Next](@next)
