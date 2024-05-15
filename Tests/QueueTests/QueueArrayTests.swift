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
}

private extension QueueFixture {
    func makeEmptySUT() -> QueueArray<Int> {
        QueueArray()
    }

    func makeNumbersSUT() -> QueueArray<Int> {
        QueueArray(array: numbers)
    }
}
