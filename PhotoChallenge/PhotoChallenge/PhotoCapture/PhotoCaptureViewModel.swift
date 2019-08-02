import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    @IBOutlet weak var imageProvider: PhotoCaptureImageUIProvider!
    var isRequestingImage: Bool {
        get {
            return true
        }
    }
//    fileprivate(set) var photo: Photo?
    var photo: Photo?

//    func captureImageIfNeeded(sourceViewController: UIViewController) {
//        guard photo == nil else {
//            return
//        }
//        
//        imageProvider.capturePhoto { (photo) in
//            self.photo = photo
//        }
//    }
}
