import Foundation

/// A last-in-first-out (LIFO) queue.
public protocol Queue {
    associatedtype Element

    /// Returns `true` if the queue is empty; `false` otherwise.
    var isEmpty: Bool { get }
    
    /// Returns the number of items currently in the queue.
    var count: Int { get }

    /// Returns the first element in the queue; may be `nil`.
    var peek: Element? { get }

    /// Appends the provided `element` to the end of the queue.
    /// - Parameter element: The element to be appended.
    /// - Returns: `true` if the enqueue was successful; `false` otherwise.
    mutating func enqueue(_ element: Element) -> Bool

    /*
    /// Removes the first element from the queue.
    /// - Returns: The removed first element.
    mutating func dequeue() -> Element?
    */
}
