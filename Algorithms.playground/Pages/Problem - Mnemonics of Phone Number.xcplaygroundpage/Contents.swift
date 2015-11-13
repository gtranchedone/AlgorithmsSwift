//: [Previous](@previous)

// O(4^n)
func mnemonicsForPhoneNumber(phoneNumber: String) -> Set<String> {
    var result = Set<String>()
    let startIndex = phoneNumber.startIndex
    let map = ["0": Set<String>(arrayLiteral: "0"),
               "1": Set<String>(arrayLiteral: "1"),
               "2": Set<String>(arrayLiteral: "A", "B", "C"),
               "3": Set<String>(arrayLiteral: "D", "E", "F"),
               "4": Set<String>(arrayLiteral: "G", "H", "I"),
               "5": Set<String>(arrayLiteral: "J", "K", "L"),
               "6": Set<String>(arrayLiteral: "M", "N", "O"),
               "7": Set<String>(arrayLiteral: "P", "Q", "R", "S"),
               "8": Set<String>(arrayLiteral: "T", "U", "V"),
               "9": Set<String>(arrayLiteral: "W", "X", "Y", "Z")]
    mnemonics(phoneNumber, i: startIndex, set: &result, map: map)
    return result
}

func mnemonics(s: String, i: String.Index, inout set: Set<String>, map: [String : Set<String>]) {
    guard i < s.endIndex else {
        set.insert(s)
        return
    }
    var newS = s
    let character = s[i]
    let correspondingChars = map[String(character)]!
    let rangeToReplace = Range<String.Index>(start: i, end: i.successor())
    for corrChar in correspondingChars {
        newS.replaceRange(rangeToReplace, with: corrChar)
        mnemonics(newS, i: i.successor(), set: &set, map: map)
    }
}

let result = mnemonicsForPhoneNumber("2276696")
result.contains("ACRONYM")

//: [Next](@next)
