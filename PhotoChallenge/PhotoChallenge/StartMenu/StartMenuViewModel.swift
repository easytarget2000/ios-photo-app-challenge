import Foundation

class StartMenuViewModel: NSObject {

    let captureActionTitle = NSLocalizedString(
        "start_menu_capture_button",
        comment: "Take Photo"
    )
    let galleryActionTitle = NSLocalizedString(
        "start_menu_gallery_button",
        comment: "View Photos"
    )
    let actions: [StartMenuAction] = [.openCapture, .openGallery]
    
    func titleForAction(_ action: StartMenuAction) -> String{
        switch action {
        case .openCapture:
            return captureActionTitle
        case .openGallery:
            return galleryActionTitle
        }
    }
    
    func performActionAtIndex(_ index: Int) {
        switch actions[index] {
        case .openCapture:
            break
        case .openGallery:
            break
        }
    }
}
