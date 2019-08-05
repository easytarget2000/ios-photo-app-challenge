import Foundation

class PhotoGalleryViewModel: NSObject {
    
    @IBOutlet weak var contentProvider: PhotoGalleryElementsProvider!
    let elements = Dynamic([PhotoGalleryElement]())
    var numberOfSections: Int {
        get {
            let hasElements = !(elements.value?.isEmpty ?? false)
            return hasElements ? 1 : 0
        }
    }
}

extension PhotoGalleryViewModel {

    func fetchElements() {
        elements.value = contentProvider.fetchElements()
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return elements.value?.count ?? 0
    }
}
