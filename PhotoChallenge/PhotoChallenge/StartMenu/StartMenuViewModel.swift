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
    let numOfButtonSections = 1
    weak var actionDelegate: StartMenuActionDelegate?
    
    func numOfButtonsInSection(_ section: Int) -> Int {
        return actions.count
    }
    
    func titleForAction(_ action: StartMenuAction) -> String{
        switch action {
        case .openCapture:
            return captureActionTitle
        case .openGallery:
            return galleryActionTitle
        }
    }
    
    func performActionAtSection(_ section: Int, index: Int) {
        switch actions[index] {
        case .openCapture:
            actionDelegate?.openCaptureActionTriggered()
        case .openGallery:
            actionDelegate?.openGalleryActionTriggered()
        }
    }
}
