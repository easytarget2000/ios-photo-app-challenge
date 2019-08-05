import Foundation

class PhotoDirectoryProvider: NSObject {
    
    var fileManager = FileManager.default
    lazy var directory: URL = {
        return fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first!
    }()
}
