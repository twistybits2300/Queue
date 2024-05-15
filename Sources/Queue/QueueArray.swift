import Foundation

/// A value semantics implementation of a queue that uses an array for its storage.
public struct QueueArray<T>: Queue {
    public typealias Element = T
    internal var storage: [T]

    // MARK: - Initialization
    /// Creates an empty queue.
    public init() {
        self.storage = [T]()
    }
    
    /// Initializes using the provided `array` for its storage.
    /// - Parameter array: The array to use for storage.
    public init(array: [T]) {
        self.storage = array
    }
    
    /// Returns `true` if this queue is empty.
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    /// Returns the number of items currently in the queue.
    public var count: Int {
        storage.count
    }
    
    /// Returns the first item in the queue. May be `nil`.
    public var peek: T? {
        storage.first
    }
    
    /// Adds the given `element` as the last item in the queue.
    /// - Parameter element: The element to be added.
    /// - Returns: always `true`, indicating success.
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        storage.append(element)
        return true
    }

    /// Removes the first item in the queue.
    /// - Returns: The removed first element in the queue; may be `nil`.
    public mutating func dequeue() -> T? {
        isEmpty ? nil : storage.removeFirst()
    }
}
