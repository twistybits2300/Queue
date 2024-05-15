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
}

private extension QueueFixture {
    func makeEmptySUT() -> QueueStack<Int> {
        QueueStack()
    }
}
