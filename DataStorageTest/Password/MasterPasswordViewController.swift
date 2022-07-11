//
//  MasterPasswordViewController.swift
//  DataStorageTest
//
//  Created by Олеся Егорова on 10.07.2022.
//

import UIKit

final class MasterPasswordViewController: UIViewController {
    
    private var password = ""
    
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTargetForTF()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.cleanTf()
    }
    
    private func addTargetForTF() {
        self.tf1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.tf2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.tf3.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.tf4.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    private func cleanTf() {
        self.tf1.text = .none
        self.tf2.text = .none
        self.tf3.text = .none
        self.tf4.text = .none
        
        self.password = ""
    }
    
    
    @objc private func textFieldDidChange(textField: UITextField) {

        guard let text = textField.text else { return }
        self.password += text
        
        if text.utf16.count == 1 {
            switch textField {
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                
                self.performSegue(withIdentifier: "repeatPassword", sender: nil)
                
                let defaults = UserDefaults.standard
                defaults.set(password, forKey: "password")
                
            default:
                break
            }
        }
    }
}
