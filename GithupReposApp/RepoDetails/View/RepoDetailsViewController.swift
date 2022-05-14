//
//  RepoDetailsViewController.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import UIKit

protocol RepoDetailsViewProtocol: UIViewController {
    var repoUIModel: RepoUIModelProtocol? { get set }
}

class RepoDetailsViewController: UIViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var repoUIModel: RepoUIModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension RepoDetailsViewController: RepoDetailsViewProtocol { }
