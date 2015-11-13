/*:
[Previous](@previous)
#Compute xy
### Write a program that takes a double x and an integer y as input and returns xy. Assume addition, multiplication, and division take constant time. You cannot use any functions, except for those you write yourself. You can ignore overflow and underflow.
*/

func raise(x: Double, toThePowerOf y: Int) -> Double {
    var result = 1.0
    var base = x, exponent: CLong = y
    if exponent < 0 {
        base = 1 / base
        exponent = -exponent
    }
    while exponent > 0 {
        if exponent & 1 > 0 {
            result *= base
        }
        base *= base
        exponent >>= 1
    }
    return result
}

raise(0, toThePowerOf: 0)
raise(2, toThePowerOf: 0)
raise(2, toThePowerOf: 1)
raise(2, toThePowerOf: 4)
raise(3, toThePowerOf: 1)
raise(3, toThePowerOf: 2)
raise(4, toThePowerOf: 3)
raise(4, toThePowerOf: -1)
raise(2, toThePowerOf: -2)
raise(3, toThePowerOf: -4)

//: [Next](@next)