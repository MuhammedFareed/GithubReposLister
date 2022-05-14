//
//  RepoUIModel.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

protocol RepoUIModelProtocol {
    var repoName: String { get set }
    var authorName: String { get set }
    var authorImageLink: String { get set }
    var description: String { get set }
}

struct RepoUIModel: RepoUIModelProtocol {
    var repoName: String
    var authorName: String
    var authorImageLink: String
    var description: String
}
