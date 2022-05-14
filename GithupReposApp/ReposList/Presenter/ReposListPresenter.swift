//
//  ReposListPresenter.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

class ReposListPresenter: ReposListPresenterProtocol {
    var view: ReposListView?
    var repo: RepoRepositoryProtocol?
    
    private var reposData: [Repo] = []
    private var reposUIModels: [RepoUIModelProtocol] = []
    
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
        return reposData.count
    }
    
    func repoUIModel(at index: Int) -> RepoUIModelProtocol {
        return reposUIModels[safe: index] ?? RepoUIModel(repoName: "", authorName: "", authorImageLink: "", description: "")
    }
    
    func showDetailsOfRepo(at index: Int) {
        
    }
    
    private func createUIModelsFor(repos: [Repo]) {
        reposUIModels = repos.map({ repo in
            let uiModel = RepoUIModel(repoName: repo.name ?? "", authorName: repo.owner?.login ?? "", authorImageLink: repo.owner?.avatarUrl ?? "", description: "")
            return uiModel
        })
    }
}
