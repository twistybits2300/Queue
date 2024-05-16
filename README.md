# Queue

A few value semantics implementations of a queue.

### features
- `protocol Queue`
- `struct QueueArray: Queue`
  - `init()`
  - `init(array: [T])`
  - `var isEmpty: Bool`
  - `var count: Int`
  - `var peek: T?`
  - `func enqueue(_:T)`
  - `func dequeue() -> T?`
- `struct QueueStack: Queue`
  - `init()`
  - `var isEmpty: Bool`
  - `var count: Int`
  - `var peek: T?`
  - `func enqueue(_:T)`
  - `func dequeue() -> T?`
- `struct QueueLinkedList: Queue`
  - `init()`
  - `var isEmpty: Bool`
  - `var count: Int`
  - `var peek: T?`
  - `func enqueue(_:T)`
  - `func dequeue() -> T?`
