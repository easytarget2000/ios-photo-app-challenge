import Foundation

class PhotoGalleryElementsProvider: NSObject {
    
    @IBOutlet weak var directoryProvider: PhotoDirectoryProvider!
    var fileManager: FileManager = FileManager.default
    
}

extension PhotoGalleryElementsProvider {
    
    func fetchElements() -> [PhotoGalleryElement] {
        let galleryDirectory = directoryProvider.directory
        var galleryFileURLs = [URL]()
        do {
            galleryFileURLs = try fileManager.contentsOfDirectory(
                at: galleryDirectory,
                includingPropertiesForKeys: [.creationDateKey, .pathKey],
                options: []
            )
        } catch {
            NSLog(
                "ERROR: PhotoGalleryElementsProvider: fetchElements(): "
                    + error.localizedDescription
            )
        }
        
        return galleryFileURLs.reduce(
            into: [PhotoGalleryElement](),
            { (interimElements, fileURL) in
                if let galleryElement = self.galleryElementFromURL(fileURL) {
                    interimElements.append(galleryElement)
                }
            }
        )
    }
    
    private func galleryElementFromURL(_ url: URL) -> PhotoGalleryElement? {
        let elementName = "PLACEHOLDER"
        let elementCreationDate = Date(timeIntervalSince1970: 0)
        let photo = photoFromURL(url)
        return PhotoGalleryElement(
            name: elementName,
            creationDate: elementCreationDate,
            photo: photo
        )
    }
    
    private func photoFromURL(_ url: URL) -> Photo? {
        do {
            let imageData = try Data(contentsOf: url)
            return Photo(data: imageData)
        } catch {
            NSLog(
                "ERROR: PhotoGalleryElementsProvider: photoFromURL(): "
                    + "\(url): \(error)"
            )
            return nil
        }
    }
    
}
