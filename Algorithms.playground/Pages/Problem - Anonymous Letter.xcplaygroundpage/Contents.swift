//: [Previous](@previous)

func can(letter: String, beConstructedFrom text: String) -> Bool {
    var dictionary = [Character : Int]()
    var index = letter.startIndex
    while index < letter.endIndex {
        let char = letter.characters[index]
        let value = dictionary[char]
        dictionary[char] = (value == nil) ? 1 : value! + 1
        index = index.successor()
    }
    index = text.startIndex
    while index < text.endIndex {
        let char = text.characters[index]
        if let value = dictionary[char] {
            if (value - 1) > 0 {
                dictionary[char] = value - 1
            }
            else {
                dictionary.removeValueForKey(char)
            }
        }
        index = index.successor()
    }
    return dictionary.isEmpty
}

can("hello", beConstructedFrom: "world")
can("hello, world", beConstructedFrom: "hello, world")
can("hello, world", beConstructedFrom: "Hello, world! I've just arrived!")
can("Hello, world", beConstructedFrom: "Hello, world! I've just arrived!")

let s = "Hello, world"
let r = Range(start: s.startIndex, end: s.endIndex)
s[r]

//: [Next](@next)
