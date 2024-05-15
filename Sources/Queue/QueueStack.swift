import Foundation

public struct QueueStack<T>: Queue {
    public typealias Element = T
    /// Upon dequeue, `rightStack` is reversed and placed into this stack.
    /// The elements can then be retrieved in FIFO order.
    public private(set) var leftStack = [Element]()

    /// The stack into which new elements are pushed.
    public private(set) var rightStack = [Element]()

    /// The number of items currently in the stack.
    public private(set) var count = 0

    // MARK: - Initialization
    public init() {
        /* no-op */
    }

    internal init(array: [T]) {
        rightStack.append(contentsOf: array)
        count += array.count
    }

    // MARK: - API
    /// Returns `true` if the queue is empty, `false` otherwise.
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }

    public var peek: T? {
        nil
    }

    public mutating func enqueue(_ element: T) -> Bool {
        false
    }

    public mutating func dequeue() -> T? {
        nil
    }
}
