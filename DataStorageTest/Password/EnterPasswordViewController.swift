//
//  EnterPasswordViewController.swift
//  DataStorageTest
//
//  Created by Олеся Егорова on 10.07.2022.
//

import UIKit

final class EnterPasswordViewController: UIViewController {
    
    private var enterPassword = ""

    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addTargetForTF()
    }
    
    private func addTargetForTF() {
        self.tf1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.tf2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.tf3.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.tf4.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc private func textFieldDidChange(textField: UITextField){
        
        guard let text = textField.text else { return }
        self.enterPassword += text
        
        if text.utf16.count == 1 {
            switch textField {
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                
                let defaults = UserDefaults.standard
                let token = defaults.string(forKey: "password")
                if token == self.enterPassword {
                    
                    self.performSegue(withIdentifier: "showDataStorage", sender: nil)
                    
                } else {
                    
                    self.cleanTf()
                    
                    self.showAlert()
                }
                
            default:
                break
            }
        }
    }
    
    private func cleanTf() {
        self.tf1.text = .none
        self.tf2.text = .none
        self.tf3.text = .none
        self.tf4.text = .none
        
        self.enterPassword = ""
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Password is incorrect", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
