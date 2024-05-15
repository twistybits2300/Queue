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
