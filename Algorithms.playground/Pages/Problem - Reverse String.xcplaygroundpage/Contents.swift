//: [Previous](@previous)

let str = "Hello playground"
let s = "Hello 🌍"

func reverseSubstring(inout s: String, startIndex: Int, endIndex: Int) -> String {
    var chars = Array(s.characters)
    var i = startIndex, j = endIndex
    while i < j {
        swap(&chars[i++], &chars[j--])
    }
    s = String(chars)
    return s
}

func reverseString(s: String) -> String {
    var newS = s
    return reverseSubstring(&newS, startIndex: 0, endIndex: s.characters.count - 1)
}

func reverseWordsInString(s: String) -> String {
    var reverse = reverseString(s)
    var wordStart = 0
    let chars = Array(reverse.characters)
    for i in 0 ..< chars.count {
        if chars[i] == " " { wordStart = i + 1 }
        if i == chars.count - 1 || chars[i + 1] == " " {
            reverseSubstring(&reverse, startIndex: wordStart, endIndex: i)
        }
    }
    return s
}

reverseString(s)
reverseWordsInString(s)

reverseString(str)
reverseWordsInString(str)

//: [Next](@next)
