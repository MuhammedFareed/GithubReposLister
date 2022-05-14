//
//  RepoRepositoryProtocol.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

typealias RepositoryFailure = (RepositoryFailureError) -> Void

protocol RepoRepositoryProtocol: AnyObject {
    func fetchReposList(onSuccess: @escaping ([Repo]) -> Void, onFailure: @escaping RepositoryFailure)
}
