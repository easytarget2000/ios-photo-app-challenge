import UIKit.UITableViewCell

class PhotoGalleryViewModel: NSObject {
    
    static let elementDescriptionFormat = NSLocalizedString(
        "photo_gallery_element_format",
        comment: "%Name, %Date"
    )
    @IBOutlet weak var contentProvider: PhotoGalleryElementsProvider!
    let elements = Dynamic([PhotoGalleryElement]())
    var numberOfSections: Int {
        get {
            let hasElements = !(elements.value?.isEmpty ?? false)
            return hasElements ? 1 : 0
        }
    }
}

extension PhotoGalleryViewModel {

    func fetchElements() {
        elements.value = contentProvider.fetchElements()
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return elements.value?.count ?? 0
    }
    
    func populateElementCell(
        _ cell: UITableViewCell,
        atIndexPath indexPath: IndexPath
    ) {
        let element = elements.value![indexPath.row]
        cell.imageView?.image = element.photo
        cell.textLabel?.text = formatElementDescription(element: element)
    }
    
    func handleSelection(
        indexPath: IndexPath,
        callback: ((PhotoGalleryElement) -> ())?
    ) {
        let element = elements.value![indexPath.row]
        callback?(element)
    }
    
    func formatElementDescription(element: PhotoGalleryElement) -> String {
        let formattedDate = formatDate(element.creationDate)
        return String(
            format: PhotoGalleryViewModel.elementDescriptionFormat,
            element.name,
            formattedDate
        )
    }
    
    func formatDate(_ date: Date) -> String {
        return date.description
    }
    
}
