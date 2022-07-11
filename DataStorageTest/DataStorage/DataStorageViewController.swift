//
//  DataStorageViewController.swift
//  DataStorageTest
//
//  Created by Олеся Егорова on 11.07.2022.
//

import UIKit

final class DataStorageViewController: UIViewController {

    @IBOutlet weak var addButton1: UIBarButtonItem!
    @IBOutlet weak var addButton2: UIBarButtonItem!
    @IBOutlet weak var addButton3: UIButton!
    
    @IBOutlet weak var info: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addButton3.layer.cornerRadius = 10
    }
    
    @IBAction func addData1(_ sender: Any) {
        self.showAddAlert()
    }
    @IBAction func addData2(_ sender: Any) {
        self.showAddAlert()
    }
    @IBAction func addData3(_ sender: Any) {
        self.showAddAlert()
    }
    
    private func showAddAlert() {
        let customAlert = CustomAlert()
        self.present(customAlert, animated: true)
        self.info.isHidden = true
    }
}
