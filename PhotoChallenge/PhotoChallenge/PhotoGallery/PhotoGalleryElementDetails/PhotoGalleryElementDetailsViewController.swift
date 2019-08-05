import UIKit

class PhotoGalleryElementDetailsViewController: UIViewController {
    
    weak var viewModel: PhotoGalleryViewModel!
    
}

// MARK: - UIViewController Life Cycle

extension PhotoGalleryElementDetailsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
}

// MARK: - Implementations

extension PhotoGalleryElementDetailsViewController {
    
    func setupViewModel() {
        
    }
}
