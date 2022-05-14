//
//  ReposListPresenter.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation
import UIKit

class ReposListPresenter: ReposListPresenterProtocol {
    var view: ReposListView?
    var repo: RepoRepositoryProtocol?
    var searcher: ReposSearcherProtocol?
    weak var coordinator: MainCoordinator?
    
    private var reposData: [Repo] = []
    private var reposUIModels: [RepoUIModelProtocol] = []
    private var filteredReposUIModels: [RepoUIModelProtocol] = []
    
    func fetchReposList() {
        view?.showLoading()
        repo?.fetchReposList(onSuccess: { repos in
            self.view?.stopLoading()
            self.reposData = repos
            self.createUIModelsFor(repos: self.reposData)
            self.view?.reloadListTableView()
        }, onFailure: { error in
            self.view?.stopLoading()
            self.view?.showError(withMessage: "something went wrong")
        })
    }
    
    func numberOfRepos() -> Int {
        return filteredReposUIModels.count
    }
    
    func repoUIModel(at index: Int) -> RepoUIModelProtocol {
        return filteredReposUIModels[safe: index] ?? RepoUIModel(repoName: "", authorName: "", authorImageLink: "", description: "")
    }
    
    func showDetailsOfRepo(at index: Int) {
        coordinator?.showRepoDetails(withUIModel: repoUIModel(at: index))
    }
    
    func searchForRepo(withSearchToken token: String) {
        guard let searcher = searcher else {
            return
        }
        let reposResult = searcher.searchByName(withSearchToken: token, inRepos: reposData)
        createUIModelsFor(repos: reposResult)
        view?.reloadListTableView()
    }
    
    private func createUIModelsFor(repos: [Repo]) {
        reposUIModels = repos.map({ repo in
            let uiModel = RepoUIModel(repoName: repo.name ?? "", authorName: repo.owner?.login ?? "", authorImageLink: repo.owner?.avatarUrl ?? "", description: repo.description ?? "")
            return uiModel
        })
        filteredReposUIModels = reposUIModels
    }
}
