import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    @IBOutlet weak var imageProvider: PhotoCaptureImageProvider!
    
    fileprivate(set) var image: UIImage?
    
    func captureImageIfNeeded() {
        guard image == nil else {
            return
        }
        
        
    }
}
