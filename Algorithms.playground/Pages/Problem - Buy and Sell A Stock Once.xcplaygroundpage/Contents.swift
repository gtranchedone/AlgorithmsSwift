/*:
 [Previous](@previous)
 # Buy and sell a stock once
 ### Write a program that takes an array of nonnegative real numbers, denoting the daily stock price for a company, and returns the maximum profit that could be made by buying and selling a single stock over that time period.
 E.g. Given the array [310, 315, 275, 295, 260, 270, 290, 230, 255, 250] the result should be 30
 which is the profit that can be made by buying the stock when it’s valued 260 and sell it at 290.
*/

func maximumProfitForTradingStockOnceWithValues(array: [Double]) -> Double {
    var lowestPrice: Double = array.first ?? 0 // 0 if empty array
    var maxProfit: Double = 0
    for priceToday in array {
        maxProfit = max(maxProfit, priceToday - lowestPrice)
        lowestPrice = min(lowestPrice, priceToday)
    }
    return maxProfit
}

let stockValues = [310.0, 315.0, 275.0, 295.0, 260.0, 270.0, 290.0, 230.0, 255.0, 250.0]
maximumProfitForTradingStockOnceWithValues(stockValues)

//: [Next](@next)
