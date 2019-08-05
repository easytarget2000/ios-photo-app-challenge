import UIKit

class PhotoGalleryElementDetailsViewController: UIViewController {
    
    @IBOutlet weak var viewModel: PhotoGalleryElementDetailsViewModel!
    
}

// MARK: - UIViewController Life Cycle

extension PhotoGalleryElementDetailsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showPhoto()
    }
    
}

// MARK: - Implementations

extension PhotoGalleryElementDetailsViewController {
    
    private func showPhoto() {
        
    }
}
