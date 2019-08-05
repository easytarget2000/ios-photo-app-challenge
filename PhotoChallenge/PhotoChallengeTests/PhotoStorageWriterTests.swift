import XCTest
@testable import PhotoChallenge

class PhotoStorageWriterTests: XCTestCase {
    
    var storageWriter = PhotoStorageWriter()
    
    func testThat_FullFileNamesAreCorrect() {
        let shortFileName = "a"
        let expectedFullName = "a.jpg"
        let actualFullName = PhotoStorageWriter.fullFileName(
            name: shortFileName,
            fileExtension: .jpeg
        )
        
        XCTAssert(actualFullName == expectedFullName)
    }
}
