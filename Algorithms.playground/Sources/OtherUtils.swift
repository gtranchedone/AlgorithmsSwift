
import Foundation

infix operator ** { }
public func ** (radix: Int, power: Int) -> Int {
    return Int(powf(Float(radix), Float(power)))
}
public func ** (radix: Float, power: Float) -> Float {
    return powf(radix, power)
}
public func ** (radix: Double, power: Double) -> Double {
    return pow(radix, power)
}
