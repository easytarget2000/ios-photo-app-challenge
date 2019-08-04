import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    @IBOutlet weak var imageProvider: PhotoCaptureImageUIProvider!

    var numberOfSections = Dynamic(0)
    fileprivate var photo: Photo? {
        didSet {
            if let _ = photo {
                numberOfSections = Dynamic(1)
            } else {
                numberOfSections = Dynamic(0)
            }
        }
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
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return 1
    }
}
