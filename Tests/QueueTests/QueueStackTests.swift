import XCTest
import os
@testable import Queue

/// Validation of `QueueStack`.
final class QueueStackTests: XCTestCase {
    private let fixture = QueueFixture()

    /// Validates that `init()` initializes an empty queue.
    func test_init() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.leftStack.isEmpty)
        XCTAssertTrue(sut.rightStack.isEmpty)
    }

    /// Validates that `isEmpty` returns `true` when the queue is empty.
    func test_isEmpty_true() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `isEmpty` returns `false` when the queue is empty.
    func test_isEmpty_false() throws {
        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)
    }

    /// Validates that `peek` returns `nil` when the queue is empty.
    func test_peek_empty() throws {
        let sut = fixture.makeEmptySUT()
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.peek)
    }

    /// Validates that `peek` returns the expected value from a queue that is not empty.
    func test_peek() throws {
        let expectedValue = try XCTUnwrap(fixture.numbers.last)
        let sut = fixture.makeNumbersSUT()
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.peek, expectedValue)
    }
}

private extension QueueFixture {
    func makeEmptySUT() -> QueueStack<Int> {
        QueueStack()
    }

    func makeNumbersSUT(
        file: StaticString = #filePath,
        line: UInt = #line) -> QueueStack<Int>
    {
        var sut = QueueStack<Int>(array: numbers)

        /*
        for value in numbers {
            XCTAssertTrue(sut.enqueue(value), file: file, line: line)
        }
        */

        return sut
    }
}
