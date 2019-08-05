import UIKit.UIImagePickerController

class PhotoCaptureUIProvider: NSObject {
    
    var imagePickerController = UIImagePickerController()
    var callback: PhotoCaptureProviderCallback?
    
    func capturePhoto(
        sourceViewController: UIViewController,
        callback: @escaping PhotoCaptureProviderCallback
    ) {
        self.callback = callback
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            handleNoImageSelection()
            return
        }
        
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        sourceViewController.present(
            imagePickerController,
            animated: true,
            completion: nil
        )
    }
    
}

// MARK: - UIImagePickerControllerDelegate

extension PhotoCaptureUIProvider:
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

extension PhotoCaptureUIProvider {
    
    private func handleImageSelection(image: UIImage) {
        callback?(image)
        callback = nil
    }
    
    private func handleNoImageSelection() {
        callback = nil
    }
    
}
