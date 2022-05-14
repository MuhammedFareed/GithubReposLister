//
//  RepoRepository.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

class RepoRepository: RepoRepositoryProtocol {
    func fetchReposList(onSuccess: @escaping ([Repo]) -> Void, onFailure: @escaping RepositoryFailure) {
        // Here should be the logic to decide to get from remote or from Cache
        RemoteRepoDataStore().fetchReposList(onSuccess: { repos in
            onSuccess(repos)
        }, onFailure: { error in
            onFailure(.networkFailure)
        })
    }
}
