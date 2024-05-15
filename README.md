# Queue

A couple of value semantics implementations of a stack: one that uses an array for its storage, the other utilizes two stacks as its storage mechanism.

### features
- [x] `protocol Queue`
- [ ] `struct QueueArray: Queue`
  - [x] `init()`
  - [x] `init(array: [T])`
  - [x] `var isEmpty: Bool`
  - [x] `var count: Int`
  - [x] `var peek: T?`
  - [x] `func enqueue(_:T)`
  - [x] `func dequeue() -> T?`
- [ ] `struct QueueStack: Queue`
  - [ ] `init()`
  - [ ] `var isEmpty: Bool`
  - [ ] `var count: Int`
  - [ ] `var peek: T?`
  - [ ] `func enqueue(_:T)`
  - [ ] `func dequeue() -> T?`
  