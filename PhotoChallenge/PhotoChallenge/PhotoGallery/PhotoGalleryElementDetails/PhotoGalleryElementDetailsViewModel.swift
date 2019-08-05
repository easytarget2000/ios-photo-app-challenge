import Foundation

class PhotoGalleryElementDetailsViewModel: NSObject {
    
    var element: PhotoGalleryElement!
    var photo: Photo? {
        get {
            return element.photo
        }
    }
}
