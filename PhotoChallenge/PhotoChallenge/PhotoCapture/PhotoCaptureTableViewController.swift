import UIKit

class PhotoCaptureTableViewController: UITableViewController {
    
    // MARK: - Values
    
    @IBOutlet weak var viewModel: PhotoCaptureViewModel!
    
}

// MARK: - UIViewController Life Cycle

extension PhotoCaptureTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
