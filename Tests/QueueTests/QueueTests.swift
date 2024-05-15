import XCTest
@testable import Queue

final class QueueTests: XCTestCase {
}

struct QueueFixture {
    var numbers: [Int] { [1, 2, 3, 4, 5] }
    var addedValue: Int { 6 }
}
