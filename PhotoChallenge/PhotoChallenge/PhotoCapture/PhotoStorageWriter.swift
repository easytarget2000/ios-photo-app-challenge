import Foundation
import CoreGraphics

class PhotoStorageWriter: NSObject {
    
    @IBOutlet weak var directoryProvider: PhotoDirectoryProvider!
    var compressionQuality = 1.0
    var documentsDirectory: URL {
        get {
            return directoryProvider.directory
        }
    }
    
    func savePhoto(_ photo: Photo, fileName: String) {
        let jpegURLAndData = self.jpegURLAndData(photo, fileName: fileName)
        let fileURL = jpegURLAndData.0
        guard let photoData = jpegURLAndData.1 else {
            return
        }
        
        do {
            try photoData.write(to: fileURL)
            #if DEBUG
                NSLog("DEBUG: PhotoStorageWriter: Did write file \(fileURL).")
            #endif
        } catch {
            NSLog("ERROR: PhotoStorageWriter: Error saving file: \(error)")
        }
    }
    
    func jpegURLAndData(_ photo: Photo, fileName: String) -> (URL, Data?) {
        let fileName = "\(fileName).jpg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        let cgCompressionQuality = CGFloat(compressionQuality)
        let jpegData = photo.jpegData(compressionQuality: cgCompressionQuality)
        return (fileURL, jpegData)
    }
}
