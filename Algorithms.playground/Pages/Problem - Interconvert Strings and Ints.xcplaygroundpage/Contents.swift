//: [Previous](@previous)

import Foundation

let stringToConvert = "-1234512345678910000"

extension String {

    func toInteger() -> Int {
        let isNegative = self.characters.first == "-"
        var result = 0
        var charactersLeft = self.utf16.count
        for utf16Code in self.utf16 {
            charactersLeft--;
            if Int16(utf16Code.value) == Int16(45) {
                continue
            }
            let unicodeIntValue = Int(Int16(utf16Code.value) - 48)
            result += Int((10 ** charactersLeft) * unicodeIntValue)
        }
        return isNegative ? -result : result
    }

}

extension Int {
    
    func toString() -> String {
        var result = ""
        var numberToConvert = abs(self)
        let isNegative = self != numberToConvert
        while numberToConvert > 0 {
            let digit = numberToConvert % 10
            let char = Character(UnicodeScalar(48 + digit))
            result = String(char) + result
            numberToConvert /= 10
        }
        if isNegative {
            result = "-" + result
        }
        return result
    }
    
}

let intValue = stringToConvert.toInteger()
let stringValue = intValue.toString()

//: [Next](@next)
