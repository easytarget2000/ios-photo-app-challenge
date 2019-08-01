import UIKit.UIImagePickerController

class PhotoCaptureImageUIProvider: NSObject {
    
    var imagePickerController = UIImagePickerController()
    var callback: PhotoCaptureImageProviderCallback?
    
    func capturePhoto(callback: @escaping PhotoCaptureImageProviderCallback) {
        self.callback = callback
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            handleNoImageSelection()
            return
        }
        
        imagePickerController.delegate = self
    }
    
}

// MARK: - UIImagePickerControllerDelegate

extension PhotoCaptureImageUIProvider:
UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info:
            [UIImagePickerController.InfoKey : Any]
    ) {
        picker.dismiss(animated: true, completion: nil)

        guard let selectedImage = info[.originalImage] as? UIImage else {
            handleNoImageSelection()
            return
        }
        
        handleImageSelection(image: selectedImage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        handleNoImageSelection()
    }
}

// MARK: - Implementations

extension PhotoCaptureImageUIProvider {
    
    fileprivate func handleImageSelection(image: UIImage) {
        callback?(image)
        callback = nil
    }
    
    fileprivate func handleNoImageSelection() {
        callback = nil
    }
    
}
