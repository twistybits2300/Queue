import XCTest
import os
@testable import Queue

/// Validation of `QueueArray`.
final class QueueArrayTests: XCTestCase {
    private let fixture = QueueFixture()

    /// Validates that `init()` provides a queue with empty storage.
    func test_init_empty() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.storage.isEmpty)
    }

    /// Validates that `init(array:)` correctly captures the given `array`.
    func test_initArray() throws {
        let sut = fixture.makeNumbersSUT()
        XCTAssertEqual(sut.storage, fixture.numbers)
    }

    /// Validates that `isEmpty` returns `true` when the queue is empty.
    func test_isEmpty_true() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `isEmpty` returns `false` when the queue has items in it.
    func test_isEmpty_false() throws {
        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)
    }

    /// Validates that `count` returns zero when the queue is empty.
    func test_count_empty() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertEqual(sut.count, 0)
    }

    /// Validates that `count` returns the expected value.
    func test_count() throws {
        let sut = fixture.makeNumbersSUT()
        XCTAssertEqual(sut.count, fixture.numbers.count)
    }

    /// Validates that `peek` returns `nil` when the queue is empty.
    func test_peek_empty() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.peek)
    }

    /// Validates that `peek` returns the expected value when the queue is not empty.
    func test_peek() throws {
        let expectedValue = fixture.numbers[0]
        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.peek, expectedValue)
    }

    /// Validates that `enqueue(element:)` correctly enqueues the given value into an empty queue.
    func test_enqueue_empty() throws {
        let addedValue = 6
        var expectedArray = [Int]()
        expectedArray.append(addedValue)

        var sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.isEmpty)

        XCTAssertTrue(sut.enqueue(addedValue))
        XCTAssertEqual(sut.storage, expectedArray)
    }

    /// Validates that `enqueue(element:)` correctly enqueues the given value into a non-empty queue.
    func test_enqueue() throws {
        var expectedArray = fixture.numbers
        expectedArray.append(fixture.addedValue)

        var sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)

        XCTAssertTrue(sut.enqueue(fixture.addedValue))
        XCTAssertEqual(sut.storage, expectedArray)
    }
}

private extension QueueFixture {
    func makeEmptySUT() -> QueueArray<Int> {
        QueueArray()
    }

    func makeNumbersSUT() -> QueueArray<Int> {
        QueueArray(array: numbers)
    }
}
