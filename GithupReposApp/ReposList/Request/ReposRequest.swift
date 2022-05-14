//
//  ReposRequest.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

enum ReposRequest: APIRequestProtocol {
    case fetchReposList
    
    var path: String {
        switch self {
        case .fetchReposList:
            return "repositories"
        }
    }
    
    var httpMethod: HTTPMethods {
        return .get
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var decodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .convertFromSnakeCase
    }
}
