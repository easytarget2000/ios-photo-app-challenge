import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    @IBOutlet weak var imageProvider: PhotoCaptureUIProvider!
    let namingSectionHeaderTitle = NSLocalizedString(
        "photo_capture_naming_header",
        comment: "File name"
    )
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
    
}

extension PhotoCaptureViewModel {

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
    
    func titleForHeaderInSection(_ section: Int) -> String {
        return namingSectionHeaderTitle
    }
    
    func savePhoto() {
        
    }
}
