import Foundation

/// A value semantics implementation of a queue that uses an array for its storage.
public struct QueueArray<T> {
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
}
