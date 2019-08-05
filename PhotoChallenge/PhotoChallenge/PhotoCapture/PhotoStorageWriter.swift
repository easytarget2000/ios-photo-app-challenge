import Foundation
import CoreGraphics

class PhotoStorageWriter: NSObject {
    
    static let jpegFileExtension = "jpg"
    private static let fullFileNameFormat = "%@.%@"
    @IBOutlet weak var directoryProvider: PhotoDirectoryProvider!
    var compressionQuality = 1.0
    var documentsDirectory: URL {
        get {
            return directoryProvider.directory
        }
    }
    
    func savePhoto(
        _ photo: Photo,
        name: String,
        fileExtension: PhotoFileExtension = .jpeg
    ) {
        let urlAndData: (URL, Data?)
        switch fileExtension {
        case .jpeg:
            urlAndData = jpegURLAndData(photo, name: name)
        }
        
        let fileURL = urlAndData.0
        guard let photoData = urlAndData.1 else {
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
    
    func jpegURLAndData(_ photo: Photo, name: String) -> (URL, Data?) {
        let fullFileName = PhotoStorageWriter.fullFileName(
            name: name,
            fileExtension: .jpeg
        )
        let fileURL = documentsDirectory.appendingPathComponent(fullFileName)
        
        let cgCompressionQuality = CGFloat(compressionQuality)
        let jpegData = photo.jpegData(compressionQuality: cgCompressionQuality)
        return (fileURL, jpegData)
    }
    
    static func fullFileName(
        name: String,
        fileExtension: PhotoFileExtension
    ) -> String {
        return String(format: fullFileNameFormat, name, fileExtension.rawValue)
    }
}
