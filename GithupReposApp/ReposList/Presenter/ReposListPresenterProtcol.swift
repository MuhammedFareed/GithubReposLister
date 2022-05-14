//
//  ReposListPresenterProtcol.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

protocol ReposListPresenterProtocol: AnyObject {
    var coordinator: MainCoordinator? { get set }
    var view: ReposListView? { get set }
    var repo: RepoRepositoryProtocol? { get set }
    var searcher: ReposSearcherProtocol? { get set }
    func fetchReposList()
    func numberOfRepos() -> Int
    func repoUIModel(at index: Int) -> RepoUIModelProtocol
    func showDetailsOfRepo(at index: Int)
    func searchForRepo(withSearchToken token: String)
}
