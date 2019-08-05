import UIKit.UIImage

class PhotoCaptureViewModel: NSObject {
    
    static let namingSectionHeaderTitle = NSLocalizedString(
        "photo_capture_naming_header",
        comment: "File name"
    )
    static let defaultPhotoName = NSLocalizedString(
        "photo_capture_default_name",
        comment: "Untitled"
    )
    @IBOutlet weak var imageProvider: PhotoCaptureUIProvider!
    @IBOutlet weak var storageWriter: PhotoStorageWriter!
    var numberOfSections = Dynamic(0)
    var photoName: Dynamic<String>
    var photo: Photo? {
        didSet {
            if let _ = photo {
                numberOfSections = Dynamic(1)
            } else {
                numberOfSections = Dynamic(0)
            }
        }
    }
    
    override init() {
        photoName = Dynamic(PhotoCaptureViewModel.defaultPhotoName)
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
        return PhotoCaptureViewModel.namingSectionHeaderTitle
    }
    
    func setupNamingCell(_ cell: PhotoCaptureNamingCell) {
        cell.textField.text = photoName.value
        cell.textField.bind {
            [weak self] in
            self?.photoName.value = $0
        }
    }
    
    func savePhoto() -> Bool {
        guard let photo = photo, let photoName = photoName.value else {
            return false
        }
        
        storageWriter.savePhoto(photo, name: photoName)
        return true
    }
}
