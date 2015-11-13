/*:
[Previous](@previous)
# Partition into anagrams
### The anagrams are in the input. For example, given the input Set [“debitcard”, “elvis”, “silent”, “badcredit”, “lives”, “freedom”, “listen”, “levis”], the algorithm should return the sets [“debitcard, “badcredit”], [“elvis, “lives”, “elvis”], [“silent”, “listen”]
*/

// O(N + MLogM) where N = input.count and M = input chars count
func groupAnagrams(input: Set<String>) -> [Set<String>] {
    var dictionary = [String : Set<String>]()
    for string in input {
        let sortedValue = stringBySortingStringChars(string)
        var set = dictionary[sortedValue] ?? Set<String>()
        set.insert(string)
        dictionary[sortedValue] = set
    }
    var anagrams = [Set<String>]()
    for (_, set) in dictionary {
        if set.count > 1 {
            anagrams.append(set)
        }
    }
    return anagrams
}

// O(NlogN)
func stringBySortingStringChars(s: String) -> String {
    let chars = s.characters.sort(<)
    return String(chars)
}

let set = Set<String>(arrayLiteral: "debitcard", "elvis", "silent", "badcredit", "lives", "freedom", "listen", "levis")
groupAnagrams(set)

//: [Next](@next)