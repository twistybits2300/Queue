import Foundation
import LinkedList

/// A Last-In-First-Out (LIFO) queue that utilizes a doubly-linked list for its storage.
public class QueueLinkedList<T: Equatable>: Queue {
    public typealias Element = T

    /// The queue's storage mechanism.
    internal private(set) var list = DoublyLinkedList<T>()

    // MARK: - Initialization
    /// Initializes an empty queue.
    public init() {
        /* no-op */
    }

    /// Initializes using the values from the provided `array`.
    /// - Parameter array: The array whose elements will be added to the queue.
    internal init(array: Array<T>) {
        let list = DoublyLinkedList<T>()

        for value in array {
            list.append(value)
        }

        self.list = list
    }

    // MARK: - Queue
    /// Returns `true` if this queue is empty.
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    /// Returns the number of items in this list.
    public var count: Int {
        guard list.head != nil else {
            return 0
        }

        var count = 0
        list.traverse { _ in
            count += 1
        }
        return count
    }
    
    /// Returns the first item in the queue. May be `nil`.
    public var peek: T? {
        list.first?.value
    }

    /// Adds the given `element` to the end of the queue.
    /// - Parameter element: The element to append.
    /// - Returns: `true` if successful; always returns `true`.
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }

    /// Removes the first item in the queue.
    /// - Returns: The removed first element in the queue; may be `nil`.
    public func dequeue() -> T? {
        guard !list.isEmpty, let node = list.first else {
            return nil
        }

        return list.remove(node)
    }
}
