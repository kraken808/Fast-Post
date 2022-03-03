//
//  BasicTextField.swift
//  Fast-Post
//
//  Created by  kraken808 on 28.02.2022.
//

import SwiftUI

struct BasicTextfield: UIViewRepresentable {
    let placeholder: String
    @Binding var text: String
    var focusable: Binding<[Bool]>? = nil
    var returnKeyType: UIReturnKeyType = .next
    var autocapitalizationType: UITextAutocapitalizationType = .none
    var keyboardType: UIKeyboardType = .default
    var foregroundColor: UIColor = .black
    var tag: Int
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.returnKeyType = returnKeyType
        textField.autocapitalizationType = autocapitalizationType
        textField.keyboardType = keyboardType
        textField.textColor = foregroundColor
        textField.textAlignment = .left
        textField.tag = tag
        //toolbar
        if keyboardType == .numberPad { ///keyboard does not have next so add next button in the toolbar
            var items = [UIBarButtonItem]()
            let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            let toolbar: UIToolbar = UIToolbar()
                  toolbar.sizeToFit()
            let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: context.coordinator, action: #selector(Coordinator.showNextTextField))
            items.append(contentsOf: [spacer, doneButton])
            toolbar.setItems(items, animated: false)
            textField.inputAccessoryView = toolbar
        }
        //Editin listener
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChange(_:)), for: .editingChanged)

        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        
        if let focusable = focusable?.wrappedValue {
            if focusable[uiView.tag] { ///set focused
                uiView.becomeFirstResponder()
            } else { ///remove keyboard
                uiView.resignFirstResponder()
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UITextFieldDelegate {
        let formTextField: BasicTextfield
        var hasEndedViaReturn = false
        weak var textField: UITextField?
        
        init(_ formTextField: BasicTextfield) {
            self.formTextField = formTextField
            self.formTextField.font(R.font.firaSansMedium.font(size: 0))
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            self.textField = textField
//            guard let textFieldCount = formTextField.focusable?.wrappedValue.count else { return }
//            var focusable: [Bool] = Array(repeating: false, count: textFieldCount) //remove focus from all text field
//            focusable[textField.tag] = true ///mark current textField focused
//            formTextField.focusable?.wrappedValue = focusable
        }
        ///work around for number pad
        @objc func showNextTextField()  {
            if let textField = self.textField {
                _ = textFieldShouldReturn(textField)
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            hasEndedViaReturn = true
            guard var focusable = formTextField.focusable?.wrappedValue else {
                textField.resignFirstResponder()
                return true
            }
            if (textField.tag + 1) != focusable.count { ///move focus to next text field if exist
                focusable[textField.tag + 1] = true
            }
            focusable[textField.tag] = false ///remove  focus from current text field
            formTextField.focusable?.wrappedValue = focusable
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if hasEndedViaReturn == false {///user dismisses keyboard
                guard let textFieldCount = formTextField.focusable?.wrappedValue.count else { return }
                ///reset all text field, so that makeUIView cannot trigger keyboard
                formTextField.focusable?.wrappedValue = Array(repeating: false, count: textFieldCount)
            } else {
                hasEndedViaReturn = false
            }
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            formTextField.text = textField.text ?? ""
        }
    }
}

