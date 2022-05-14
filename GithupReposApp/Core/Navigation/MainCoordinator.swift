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
        repoListPresenter.repo = repoRepository
        let repoListViewController = ReposListViewController.instantiate(fromStoryBoard: StoryboardNames.mainStoryboard)
        repoListPresenter.view = repoListViewController
        repoListViewController.preseneter = repoListPresenter
        navigationController.pushViewController(repoListViewController, animated: true)
    }
}
