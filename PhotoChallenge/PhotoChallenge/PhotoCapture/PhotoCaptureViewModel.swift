import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    @IBOutlet weak var imageProvider: PhotoCaptureImageUIProvider!

    fileprivate(set) var photo: Photo?
    
    var numberOfSections: Int {
        return photo == nil ? 0 : 1
    }

    func captureImageIfNeeded(sourceViewController: UIViewController) {
        guard photo == nil else {
            return
        }
        
        imageProvider.capturePhoto(sourceViewController: sourceViewController) {
            (photo) in
            self.photo = photo
        }
    }
    
    func numberOfRowsInSection(_ section: Int) {
        return 1
    }
}
