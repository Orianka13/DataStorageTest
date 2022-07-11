//
//  OnboardingModel.swift
//  DataStorageTest
//
//  Created by Олеся Егорова on 10.07.2022.
//

import Foundation
import UIKit

struct OnboardingPageModel {
    var image: UIImage
    var title: String
    var description: String
}

extension OnboardingPageModel {
    static func getData() -> [OnboardingPageModel] {
        let array = [OnboardingPageModel(image: UIImage(named: "Content") ?? UIImage(), title: "Safety", description: "All data in the storage is available only to you, no one can access it, even we, all data is stored locally"),
                     OnboardingPageModel(image: UIImage(named: "SecuringData") ?? UIImage(), title: "Securing Data", description: "All your data is securely password protected. You can also set access only by face ID"),
                     OnboardingPageModel(image: UIImage(named: "OnlyImportant") ?? UIImage(), title: "Only Important", description: "Keep only the most important data: passwords, bank cards, photos and more thanks to GuardGrade")]
        return array
    }
}

struct Data {
    let imageNameArray = ["Content", "SecuringData", "OnlyImportant"]
    let titleArray = ["Safety", "Securing Data", "Only Important"]
    let descriptionArray = ["All data in the storage is available only to you, no one can access it, even we, all data is stored locally",
                            "All your data is securely password protected. You can also set access only by face ID",
                            "Keep only the most important data: passwords, bank cards, photos and more thanks to GuardGrade"]
    
}




