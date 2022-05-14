//
//  ReposAPIClient.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

class MoviesAPIClient: APIClient {
    var baseURL: String = "https://api.github.com"
    var session: URLSession
    
    init(withSession session: URLSession = URLSession.shared) {
        self.session = session
    }
}
