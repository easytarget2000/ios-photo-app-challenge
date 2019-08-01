import UIKit

class StartMenuTableViewController: UITableViewController {
    
    // MARK: - Values
    
    static let toPhotoCaptureSegueIdentifier = "StartMenuToPhotoCapture"
    static let actionCellIdentifier = "StartMenuActionCell"
    @IBOutlet weak var viewModel: StartMenuViewModel!
    
    fileprivate var numOfSections: Int {
        get {
            return viewModel.numOfButtonSections
        }
    }
    
}

// MARK: - UIViewController Life Cycle

extension StartMenuTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
}

// MARK: - UITableViewDataSource

extension StartMenuTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return numOfSections
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return numOfButtonsInSection(section)
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: StartMenuTableViewController.actionCellIdentifier,
            for: indexPath
        )
        let section = indexPath.section
        let index = indexPath.row
        cell.textLabel?.text = titleForActionInSection(section, atIndex: index)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension StartMenuTableViewController {

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        let section = indexPath.section
        let index = indexPath.row
        performActionInSection(section, atIndex: index)
    }

}

// MARK: - StartMenuActionDelegate

extension StartMenuTableViewController: StartMenuActionDelegate {
    
    func openCaptureActionTriggered() {
        showCaptureViewController()
    }
    
    func openGalleryActionTriggered() {
        showGalleryViewController()
    }
}

// MARK: - Implementations

extension StartMenuTableViewController {
    
    fileprivate func configureViewModel() {
        viewModel.actionDelegate = self
    }
    
    fileprivate func numOfButtonsInSection(_ section: Int) -> Int {
        return viewModel.numOfButtonsInSection(section)
    }
    
    fileprivate func performActionInSection(
        _ section: Int,
        atIndex index: Int
    ) {
        viewModel.performActionInSection(section, atIndex: index)
    }
    
    fileprivate func titleForActionInSection(
        _ section: Int,
        atIndex index: Int
    ) -> String {
        return viewModel.titleForActionInSection(section, atIndex: index)
    }
    
    fileprivate func showCaptureViewController() {
        performSegue(
            withIdentifier:
                StartMenuTableViewController.toPhotoCaptureSegueIdentifier,
            sender: nil
        )
    }
    
    fileprivate func showGalleryViewController() {
        
    }
}
