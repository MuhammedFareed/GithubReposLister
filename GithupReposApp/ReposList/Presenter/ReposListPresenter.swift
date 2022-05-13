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
        
    }
    
    func numberOfRepos() -> Int {
        return reposData.count
    }
    
    func repoUIModel(at index: Int) -> RepoUIModelProtocol {
        return reposUIModels[index]
    }
}
