//
//  ReposSearcher.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

class ReposSearcher: ReposSearcherProtocol {
    func searchByName(withSearchToken searchToken: String, inRepos repos: [Repo]) -> [Repo] {
        guard searchToken.count > 2 else {
            return repos
        }
        return repos
    }
}
