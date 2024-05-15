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

    /// Returns the first element in the queue; may be `nil`.
    public var peek: T? {
        leftStack.isEmpty ? rightStack.last : leftStack.last
    }

    /// Adds the given `element` to the end of the queue.
    /// - Parameter element: The element to append.
    /// - Returns: `true` if successful; always returns `true`.
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        count += 1
        rightStack.append(element)
        return true
    }

    public mutating func dequeue() -> T? {
        nil
    }
}
