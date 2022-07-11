//
//  CustomAlert.swift
//  DataStorageTest
//
//  Created by Олеся Егорова on 11.07.2022.
//

import UIKit

final class CustomAlert: UIViewController {
    
    private enum Literal {
        static let nibName = "CustomAlert"
        static let error = "init(coder:) has not been implemented"
    }
    
    private enum Metrics {
        static let cornerRadius = CGFloat(10)
    }
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var passwordTf: UILabel!
    @IBOutlet weak var cardTf: UILabel!
    @IBOutlet weak var contactTf: UILabel!
    
    init() {
        
        super.init(nibName: Literal.nibName, bundle: Bundle(for: CustomAlert.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError(Literal.error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alertView.layer.cornerRadius = Metrics.cornerRadius
        self.passwordTf.layer.cornerRadius = Metrics.cornerRadius
        self.cardTf.layer.cornerRadius = Metrics.cornerRadius
        self.contactTf.layer.cornerRadius = Metrics.cornerRadius
    }
    
    @IBAction private func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
