//
//  MainCoordinator.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let repoRepository = RepoRepository()
        let repoListPresenter = ReposListPresenter()
        let repoSearcher = ReposSearcher()
        repoListPresenter.repo = repoRepository
        repoListPresenter.searcher = repoSearcher
        let repoListViewController = ReposListViewController.instantiate(fromStoryBoard: StoryboardNames.mainStoryboard)
        repoListPresenter.view = repoListViewController
        repoListViewController.preseneter = repoListPresenter
        repoListPresenter.coordinator = self
        navigationController.pushViewController(repoListViewController, animated: true)
    }
    
    func showRepoDetails(withUIModel repoUIModel: RepoUIModelProtocol) {
        let repoDetailsViewController = RepoDetailsViewController.instantiate(fromStoryBoard: StoryboardNames.mainStoryboard)
        repoDetailsViewController.repoUIModel = repoUIModel
        navigationController.pushViewController(repoDetailsViewController, animated: true)
    }
}
