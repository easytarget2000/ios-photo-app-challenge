import XCTest
@testable import PhotoChallenge

class PhotoChallengeTests: XCTestCase {

    var viewModel = PhotoCaptureViewModel()
    
    override func setUp() {
    }
    
    func testThat_NilPhotoIsNotSaved() {
        viewModel.photo = nil
        let didSavePhoto = viewModel.savePhoto()
        XCTAssert(!didSavePhoto)
    }
}
