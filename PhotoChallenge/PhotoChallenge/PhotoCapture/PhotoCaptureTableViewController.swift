import UIKit

class PhotoCaptureTableViewController: UITableViewController {
    
    // MARK: - Values
    
    @IBOutlet weak var viewModel: PhotoCaptureViewModel!
    @IBOutlet weak var imageProvider: PhotoCaptureImageUIProvider!

}

// MARK: - UIViewController Life Cycle

extension PhotoCaptureTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showImagePickerControllerIfNeeded()
    }
}

// MARK: - UITableViewDataSource

extension PhotoCaptureTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
}

// MARK: - Implementations

extension PhotoCaptureTableViewController {
    
    fileprivate func showImagePickerControllerIfNeeded() {
        viewModel.captureImageIfNeeded(sourceViewController: self)
    }
}
