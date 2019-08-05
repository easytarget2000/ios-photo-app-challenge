import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    @IBOutlet weak var imageProvider: PhotoCaptureUIProvider!
    @IBOutlet weak var storageWriter: PhotoStorageWriter!
    let namingSectionHeaderTitle = NSLocalizedString(
        "photo_capture_naming_header",
        comment: "File name"
    )
    let defaultPhotoName = NSLocalizedString(
        "photo_capture_default_name",
        comment: "Untitled"
    )
    var numberOfSections = Dynamic(0)
    var photoName: Dynamic<String>
    fileprivate var photo: Photo? {
        didSet {
            if let _ = photo {
                numberOfSections = Dynamic(1)
            } else {
                numberOfSections = Dynamic(0)
            }
        }
    }
    
    override init() {
        photoName = Dynamic(defaultPhotoName)
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
    
    func setupNamingCell(_ cell: PhotoCaptureNamingCell) {
        cell.textField.text = photoName.value
        cell.textField.bind {
            [weak self] in
            self?.photoName.value = $0
        }
    }
    
    func savePhoto() {
        guard let photo = photo, let photoName = photoName.value else {
            return
        }
        storageWriter.savePhoto(photo, fileName: photoName)
    }
}
