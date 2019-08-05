import UIKit

class PhotoGalleryTableViewController: UITableViewController {
    
    @IBOutlet weak var viewModel: PhotoGalleryViewModel!
    private var numberOfSections: Int {
        get {
            return viewModel.numberOfSections
        }
    }
}

// MARK: - UIViewController Life Cycle

extension PhotoGalleryTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchElements()
    }
}

// MARK: - UITableViewDataSource

extension PhotoGalleryTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return numberOfRowsInSection(section)
    }

}

// MARK: - Implementations

extension PhotoGalleryTableViewController {
    
    private func setupViewModel() {
        viewModel.elements.bind {
            [weak self] in
            let _ = $0
            self?.reloadTableView()
        }
    }
    
    private func fetchElements() {
        viewModel.fetchElements()
    }
    
    private func numberOfRowsInSection(_ section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
}
