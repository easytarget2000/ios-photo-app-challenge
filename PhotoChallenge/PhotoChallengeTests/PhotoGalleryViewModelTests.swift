import XCTest
@testable import PhotoChallenge

class PhotoGalleryViewModelTests: XCTestCase {
    
    var viewModel = PhotoGalleryViewModel()
    
    func testThat_NumberOfSectionsIsZeroWithoutElements() {
        viewModel.elements.value = []
        XCTAssert(viewModel.numberOfSections == 0)
    }
    
    func testThat_ElementDescriptionsAreCorrect() {
        let elementDate = Date.init(timeIntervalSince1970: 0)
        let element = PhotoGalleryElement(
            name: "test.jpg",
            creationDate: elementDate,
            photo: nil
        )
        let actualDescription = viewModel.formatElementDescription(
            element: element
        )
        let expectedDescription = "test.jpg, 1970-01-01 00:00:00 +0000"
        
        XCTAssert(actualDescription == expectedDescription)
    }
}
