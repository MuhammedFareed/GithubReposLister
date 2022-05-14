//
//  RemoteRepoDataStore.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

class RemoteRepoDataStore: RepoDataStoreProtocol {
    var apiClient: APIClient
    
    init(withAPIClient apiClient: APIClient = MoviesAPIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchReposList(onSuccess: @escaping ([Repo]) -> Void, onFailure: @escaping NetworkFailure) {
        apiClient.start(withRequest: ReposRequest.fetchReposList, responseType: [Repo].self, onSuccess: { repos in
            if let reposList = repos as? [Repo] {
                onSuccess(reposList)
            } else {
                onFailure(NetworkError.decodingError)
            }
        }, onFailure:  { error in
            onFailure(error)
        })
    }
}
