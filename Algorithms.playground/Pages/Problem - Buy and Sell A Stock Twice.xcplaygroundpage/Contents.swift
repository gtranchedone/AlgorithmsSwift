/*:
 [Previous](@previous)
 # Buy and sell a stock once
 ### Write a program that takes an array of nonnegative real numbers, denoting the daily stock price for a company, and returns the maximum profit that could be made by buying and selling a single stock over that time period twice.
 E.g. Given the array [310, 315, 275, 295, 260, 270, 290, 230, 255, 250] the result should be 55
 which is the profit that can be made by buying the stock when it’s valued 260 and sell it at 290 and by again at 230 to sell at 255.
*/

struct Trade {
    let buyIndex: Int
    let sellIndex: Int
    let profit: Double
}

func maximumProfitForTradingStockTwiceWithValues(array: [Double], exludingTrade trade: Trade?) -> Trade {
    var buyIndex = 0
    var sellIndex = 0
    var maxProfit = 0.0
    var lowestPrice = Double.infinity
    var indexOfLowestPrice = 0
    for i in 0 ..< array.count {
        if let trade = trade {
            if i >= trade.buyIndex && i <= trade.sellIndex { continue }
        }
        let priceToday = array[i]
        if maxProfit < priceToday - lowestPrice {
            maxProfit = array[i] - lowestPrice
            buyIndex = indexOfLowestPrice
            sellIndex = i
        }
        if lowestPrice > priceToday {
            lowestPrice = priceToday
            indexOfLowestPrice = i
        }
    }
    return Trade(buyIndex: buyIndex, sellIndex: sellIndex, profit: maxProfit)
}

func maximumProfitForTradingStockTwiceWithValues(values: [Double]) -> Double {
    let trade1 = maximumProfitForTradingStockTwiceWithValues(values, exludingTrade: nil)
    let trade2 = maximumProfitForTradingStockTwiceWithValues(values, exludingTrade: trade1)
    return trade1.profit + trade2.profit
}

let stockValues = [310.0, 315.0, 275.0, 295.0, 260.0, 270.0, 290.0, 230.0, 255.0, 250.0]
maximumProfitForTradingStockTwiceWithValues(stockValues)

//: [Next](@next)
