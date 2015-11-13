//: [Previous](@previous)

import Foundation

// If we just take all the files and combine them, we could run
// merge sort on the result for O(NlogN) performance guaranteed.
// A more efficient way is to use a Heap / Priority Queue
// and add only a bunch of items to the queue in every iteration.
// We can do that since the trades are already sorted in each file.
// That would mean that the PQ would run all operations at log k time,
// where k is the number of items on the PQ. k will always be <= N.

struct Trade: Comparable, CustomStringConvertible {
    let timestamp: String
    let numberOfStocks: Int
    let stockID: String
    let price: Double
    
    var description: String {
        get { return "\(timestamp),\(stockID),\(numberOfStocks),\(price)" }
    }
    
    init(string: String) {
        let components = string.componentsSeparatedByString(",")
        self.timestamp = components[0]
        self.numberOfStocks = Int(components[2])!
        self.stockID = components[1]
        self.price = Double(components[3])!
    }
    
}

func ==(lhs: Trade, rhs: Trade) -> Bool { return lhs.timestamp == rhs.timestamp && lhs.stockID == rhs.stockID }
func <(lhs: Trade, rhs: Trade) -> Bool { return Double(lhs.timestamp) < Double(rhs.timestamp) }
func <=(lhs: Trade, rhs: Trade) -> Bool { return Double(lhs.timestamp) <= Double(rhs.timestamp) }
func >=(lhs: Trade, rhs: Trade) -> Bool  { return Double(lhs.timestamp) >= Double(rhs.timestamp) }
func >(lhs: Trade, rhs: Trade) -> Bool  { return Double(lhs.timestamp) > Double(rhs.timestamp) }

func mergeTradeFiles(files: [[String]]) -> [String] {
    let queue = PriorityQueue<Trade>(type: .Min)
    var mergedFile = [Trade]()
    var theFiles = files
    repeat {
        for i in 0 ..< theFiles.count {
            var file = theFiles[i]
            if !file.isEmpty {
                queue.enqueue(Trade(string: file.removeFirst()))
                theFiles[i] = file
            }
        }
        // if we dequeue here as well adding and removing lines trades on the queue takes O(k) time where k <= N, k = N on small inputs
        if !queue.isEmpty { mergedFile.append(queue.dequeue()!) }
    } while(!queue.isEmpty)
    return mergedFile.map { trade -> String in return trade.description }
}

let file1 = ["000001,AAPL,10,100.0", "000010,AAPL,20,120.0", "000011,AAPL,250,90.0"]
let file2 = ["000001,GOOGL,10,100.0", "000011,GOOGL,20,120.0", "000013,GOOGL,250,90.0"]
let file3 = ["000003,FB,10,100.0", "000031,FB,20,120.0", "000052,FB,250,90.0"]
let file4 = ["000005,EBAY,10,100.0", "000022,EBAY,20,120.0", "000023,EBAY,250,90.0"]
let files = [file1, file2, file3, file4]
let mergedFile = mergeTradeFiles(files)
for line in mergedFile {
    print(line)
}

//: [Next](@next)