//
//  Repo.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

struct Repo: Codable {
    var name: String?
    var description: String?
    var owner: Owner?
}
