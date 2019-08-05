import UIKit

class PhotoCaptureTableViewController: UITableViewController {
    
    // MARK: - Values
    
    @IBOutlet weak var viewModel: PhotoCaptureViewModel!
    @IBOutlet weak var imageProvider: PhotoCaptureUIProvider!
    @IBAction func saveButtonTouched(_ sender: Any) {
        savePhoto()
    }
    
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
        titleForHeaderInSection section: Int
    ) -> String? {
        return viewModel.titleForHeaderInSection(section)
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let namingCell = tableView.dequeueReusableCell(
            withIdentifier: PhotoCaptureNamingCell.identifier,
            for: indexPath
        ) as! PhotoCaptureNamingCell
        viewModel.setupNamingCell(namingCell)
        return namingCell
    }
}

// MARK: - Implementations

extension PhotoCaptureTableViewController {
    
    private func setupViewModel() {
        viewModel.numberOfSections.bind = {
            [weak self] in
            let _ = $0
            self?.reloadTableView()
        }
    }
    
    private func showImagePickerControllerIfNeeded() {
        viewModel.captureImageIfNeeded(sourceViewController: self)
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    private func savePhoto() {
        let _ = viewModel.savePhoto()
    }
}
