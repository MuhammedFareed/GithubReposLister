//
//  ReposSearcherProtocol.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation
protocol ReposSearcherProtocol: AnyObject {
    func searchByName(withSearchToken searchToken: String, inRepos repos:[Repo]) -> [Repo]
}
