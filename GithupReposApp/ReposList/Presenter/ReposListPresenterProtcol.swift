//
//  ReposListPresenterProtcol.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

protocol ReposListPresenterProtocol: AnyObject {
    var view: ReposListView? { get set }
    var repo: RepoRepositoryProtocol? { get set }
    func fetchReposList()
    func numberOfRepos() -> Int
    func repoUIModel(at index: Int) -> RepoUIModel
}
