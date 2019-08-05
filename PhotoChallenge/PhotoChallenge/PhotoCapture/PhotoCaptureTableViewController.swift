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
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showImagePickerControllerIfNeeded()
    }
}

// MARK: - UITableViewDataSource

extension PhotoCaptureTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections.value ?? 0
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let namingCell = tableView.dequeueReusableCell(
            withIdentifier: PhotoCaptureNamingCell.identifier,
            for: indexPath
        )
        
        return namingCell
    }
}

// MARK: - Implementations

extension PhotoCaptureTableViewController {
    
    fileprivate func setupViewModel() {
        viewModel.numberOfSections.bind = {
            [weak self] in
            let _ = $0
            self?.reloadTableView()
        }
    }
    
    fileprivate func showImagePickerControllerIfNeeded() {
        viewModel.captureImageIfNeeded(sourceViewController: self)
    }
    
    fileprivate func reloadTableView() {
        tableView.reloadData()
    }
}
