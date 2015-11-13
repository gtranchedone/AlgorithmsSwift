/*:
[Previous](@previous)
# Replace and remove
### Write a program which takes as input a string s, and removes each “b” and replaces each “a” with “dd”. Assume s is stored in an array that has enough spaces for the final result.
*/

// O(n) time and space. If space is already allocaded correcly, instead of iterating forward
// we can iterate backwards and take O(n) time but O(1) space in other languages, but not in Swift as Arrays are values
func replaceAndRemove(s: String) -> String {
    let oldChars = s.characters
    var newChars = String.CharacterView()
    var index = oldChars.startIndex
    while index < oldChars.endIndex {
        let currentChar = oldChars[index]
        if currentChar == "a"  {
            newChars.append("d")
            newChars.append("d")
        }
        else if currentChar != "b" {
            newChars.append(currentChar)
        }
        index = index.successor()
    }
    return String(newChars)
}

replaceAndRemove("abcd")
replaceAndRemove("bbbbbbbb")
replaceAndRemove("aaa")
replaceAndRemove("abcabcabc")

//: [Next](@next)
