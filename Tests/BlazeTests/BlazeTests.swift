import XCTest
@testable import Blaze

final class BlazeTests: XCTestCase {
    func testBaseUrlSetsCorrectly() throws {
        Blaze.initialise(with: "https://github.com")
        XCTAssert(Blaze._baseURL?.isEmpty == false, "Base url must not be empty")
    }
}
