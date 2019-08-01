import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    @IBOutlet weak var imageProvider: PhotoCaptureImageUIProvider!
    fileprivate(set) var photo: Photo?
    
    func captureImageIfNeeded() {
        guard photo == nil else {
            return
        }
        
        imageProvider.capturePhoto { (photo) in
            self.photo = photo
        }
    }
}
