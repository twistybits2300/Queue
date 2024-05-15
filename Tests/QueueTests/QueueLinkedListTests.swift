import XCTest
import os
import LinkedList
@testable import Queue

/// Validation of `QueueLinkedList`.
final class QueueLinkedListTests: XCTestCase {
    private let fixture = QueueFixture()

    /// Validates that `init()` initializes an empty queue.
    func test_init_returns_empty_queue() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.list.isEmpty)
    }

    /// Validates that `init(array:)` correctly captures the given `array`.
    func test_initArray() throws {
        let sut = fixture.makeNumbersSUT()
        let array = fixture.toArray(sut: sut)
        XCTAssertEqual(array, fixture.numbers)
    }

    /// Validates that `isEmpty` returns `true` when the queue is empty.
    func test_isEmpty_true() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `isEmpty` returns `false` when the queue is empty.
    func test_isEmpty_false() throws {
        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)
    }

    /// Validates that `count` returns zero when the list is empty.
    func test_count_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertEqual(sut.count, 0)
    }

    /// Validates that `count` returns the expected value.
    func test_count() throws {
        let expectedCount = fixture.numbers.count
        print(fixture.numbers)
        let sut = fixture.makeNumbersSUT()
        XCTAssertEqual(sut.count, expectedCount)
    }

    /// Validates that `peek` returns `nil` when the queue is empty.
    func test_peek_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.peek)
    }

    /// Validates that `peek` returns the expected value from a queue that is not empty.
    func test_peek() throws {
        let expectedValue = fixture.numbers[0]
        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.peek, expectedValue)
    }

    /// Validates that `enqueue(element:)` correctly enqueues the given value into an empty queue.
    func test_enqueue_empty() throws {
        let addedValue = 6
        let expectedList = DoublyLinkedList<Int>()
        expectedList.append(addedValue)

        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)

        XCTAssertTrue(sut.enqueue(addedValue))

        /* we don't want to use Equatable here because
         the list checks form same instances of `head`
         and `tail`; instead we'll just ensure these
         node's `value`s are equal. */
        XCTAssertEqual(sut.list.head, expectedList.head)
        XCTAssertEqual(sut.list.tail, expectedList.tail)
    }

    /// Validates that `enqueue(element:)` correctly enqueues the given value into a non-empty queue.
    func test_enqueue() throws {
        let expectedList = fixture.numbers.toDoublyLinkedList()
        expectedList.append(fixture.addedValue)

        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)

        XCTAssertTrue(sut.enqueue(fixture.addedValue))

        /* we don't want to use Equatable here because
         the list checks form same instances of `head`
         and `tail`; instead we'll just ensure these
         node's `value`s are equal. */
        XCTAssertEqual(sut.list.head?.value, expectedList.head?.value)
        XCTAssertEqual(sut.list.tail?.value, expectedList.tail?.value)
    }

    /// Validates that `dequeue()` returns `nil` when the queue is empty.
    func test_dequeue_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.dequeue())
    }

    /// Validates that after `dequeue()` from a queue with one element the queue is empty.
    func test_dequeue_one_element() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)

        XCTAssertTrue(sut.enqueue(fixture.addedValue))
        XCTAssertFalse(sut.isEmpty)

        let dequeuedValue = try XCTUnwrap(sut.dequeue())
        XCTAssertEqual(dequeuedValue, fixture.addedValue)
    }

    /// Validates that `dequeue()` from a queue with multiple elements returns the expected value.
    func test_dequeue() throws {
        let expectedValue = fixture.numbers[0]

        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)

        let dequeuedValue = sut.dequeue()
        XCTAssertEqual(dequeuedValue, expectedValue)
    }
}

private extension QueueFixture {
    func makeSUT() -> QueueLinkedList<Int> {
        QueueLinkedList()
    }

    func makeNumbersSUT() -> QueueLinkedList<Int> {
        QueueLinkedList(array: numbers)
    }

    func toArray<T>(sut: QueueLinkedList<T>) -> Array<T> {
        toArrayForward(list: sut.list)
    }
}
