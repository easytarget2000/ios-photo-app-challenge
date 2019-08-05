import UIKit

class PhotoGalleryElementDetailsViewController: UIViewController {
    
    @IBOutlet weak var viewModel: PhotoGalleryElementDetailsViewModel!
    @IBOutlet weak var imageView: UIImageView!
    
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
        imageView.image = viewModel.photo
    }
}
