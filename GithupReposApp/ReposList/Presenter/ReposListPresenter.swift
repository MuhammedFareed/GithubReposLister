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
    
    func fetchReposList() {
        
    }
    
    func numberOfRepos() -> Int {
        return 0
    }
    
    func repoUIModel(at index: Int) -> RepoUIModel {
        return RepoUIModel(repoName: "", authorName: "", authorImageLink: "")
    }
}
