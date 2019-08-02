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
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

// MARK: - Implementations

extension PhotoCaptureTableViewController {
    
    fileprivate func showImagePickerControllerIfNeeded() {
        guard viewModel.isRequestingImage else {
            return
        }
        
        imageProvider.capturePhoto(sourceViewController: self) { (photo) in
            self.viewModel.photo = photo
        }
    }
}
