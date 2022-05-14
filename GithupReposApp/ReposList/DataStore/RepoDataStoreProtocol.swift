//
//  RepoDataStoreProtocol.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

protocol RepoDataStoreProtocol: AnyObject {
    func fetchReposList(onSuccess: @escaping ([Repo]) -> Void, onFailure: @escaping NetworkFailure)
}
