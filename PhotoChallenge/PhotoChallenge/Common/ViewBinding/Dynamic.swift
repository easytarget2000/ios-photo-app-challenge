// Modified version of Mohammad Azam's Dynamic type
// https://medium.com/@azamsharp/mvvm-in-ios-from-net-perspective-580eb7f4f129

class Dynamic<T> {
    
    var bind: (T) -> () = { _ in }
    
    var value: T? {
        didSet {
            bind(value!)
        }
    }
    
    init(_ v: T) {
        value = v
    }
    
}
