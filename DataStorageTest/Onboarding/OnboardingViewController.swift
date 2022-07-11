//
//  ViewController.swift
//  DataStorageTest
//
//  Created by Олеся Егорова on 10.07.2022.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private enum Identifiers {
        static let segueId = "createPassword"
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let data = OnboardingPageModel.getData()
    
    private var tappedCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.numberOfPages = data.count
        self.pageControl.currentPage = 0
    }

    @IBAction func nextScreenButton(_ sender: UIButton) {
        self.pageControl.currentPage += 1
        self.tappedCount += 1
        let item = data[self.pageControl.currentPage]
    
            self.image.image = item.image
            self.titleLabel.text = item.title
            self.descriptionLabel.text = item.description
        
        if self.tappedCount > 2 {
            performSegue(withIdentifier: Identifiers.segueId, sender: nil)
        }
    }
}

