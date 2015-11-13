
public protocol BinaryNodeType: AnyObject, CustomStringConvertible {
    typealias ValueType
    typealias NodeType
    
    var value: ValueType { get }
    var left: NodeType?  { get set }
    var right: NodeType? { get set }
    
}

public extension BinaryNodeType {
    
    public var description: String {
        get {
            var description = "value: \(value)"
            if let left = left {
                description += ", left \(left)"
            }
            if let right = right {
                description += ", right \(right)"
            }
            return description
        }
    }
    
}

public class BinaryNode<T: Comparable>: BinaryNodeType {
    public typealias ValueType = T
    public typealias NodeType = BinaryNode<T>
    
    public let value: ValueType
    public var left: NodeType?
    public var right: NodeType?
    public init(value: T) { self.value = value }
}

public class FullBinaryNode<T: Comparable>: BinaryNodeType {
    public typealias ValueType = T
    public typealias NodeType = FullBinaryNode<T>
    
    public let value: ValueType
    public var left: NodeType? {
        didSet {
            left?.parent = self
        }
    }
    public var right: NodeType? {
        didSet {
            right?.parent = self
        }
    }
    private(set) public var parent: FullBinaryNode<T>?
    
    public var depth: Int {
        return 1 + (parent?.depth ?? 0)
    }
    
    public init(value: T) {
        self.value = value
    }
}
