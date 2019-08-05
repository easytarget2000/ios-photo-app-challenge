import UIKit

class PhotoGalleryTableViewController: UITableViewController {
    
    static let toDetailsSegue = "PhotoGalleryToElementDetailsSegue"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsViewController = segue.destination
            as! PhotoGalleryElementDetailsViewController
        detailsViewController.viewModel.element
            = (sender as! PhotoGalleryElement)
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

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let elementCell = tableView.dequeueReusableCell(
            withIdentifier: PhotoGalleryElementCell.identifier,
            for: indexPath
        )
        viewModel.populateElementCell(elementCell, atIndexPath: indexPath)
        return elementCell
    }
}

// MARK: - UITableViewDelegate

extension PhotoGalleryTableViewController {
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        handleSelection(indexPath: indexPath)
    }
}

// MARK: - Implementations

extension PhotoGalleryTableViewController {
    
    private func setupViewModel() {
        viewModel.elements.bind = {
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
    
    private func handleSelection(indexPath: IndexPath) {
        viewModel.handleSelection(indexPath: indexPath) { (element) in
            self.showDetailsOfElement(element)
        }
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    private func showDetailsOfElement(_ element: PhotoGalleryElement) {
        performSegue(
            withIdentifier: PhotoGalleryTableViewController.toDetailsSegue,
            sender: element
        )
    }

}
