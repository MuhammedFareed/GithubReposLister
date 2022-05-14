//
//  StoryboardaLoadableProtocol.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import UIKit

protocol StoryboardaLoadableProtocol {
    static func instantiate(fromStoryBoard storyboardName: StoryboardNames) -> Self
}

extension StoryboardaLoadableProtocol where Self: UIViewController {
    static func instantiate(fromStoryBoard storyboardName: StoryboardNames) -> Self {
        let fullName = NSStringFromClass(self)

        let className = fullName.components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
