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
}

private extension QueueFixture {
    func makeEmptySUT() -> QueueArray<Int> {
        QueueArray()
    }

    func makeNumbersSUT() -> QueueArray<Int> {
        QueueArray(array: numbers)
    }
}
