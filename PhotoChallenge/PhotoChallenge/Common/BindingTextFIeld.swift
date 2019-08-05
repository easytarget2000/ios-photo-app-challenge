// Modified version of Mohammad Azam's BindingTextField
// https://medium.com/@azamsharp/mvvm-in-ios-from-net-perspective-580eb7f4f129

import UIKit.UITextField

class BindingTextField : UITextField {
    
    var textChanged :(String) -> () = { _ in }
    
    func bind(callback :@escaping (String) -> ()) {
        self.textChanged = callback
        self.addTarget(
            self,
            action: #selector(textFieldDidChange),
            for: .editingChanged
        )
    }
    
    @objc fileprivate func textFieldDidChange(_ textField :UITextField) {
        textChanged(textField.text!)
    }
    
}
