//
//  StubbedReposAPIClient.swift
//  GithupReposAppTests
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation
@testable import GithupReposApp

class StubbedReposAPIClient: APIClient {
    var session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    
    var baseURL: String = ""
    
    var shouldSucceed = true
    
    var returnedResponse: Codable!
    
    func start<T>(withRequest request: APIRequestProtocol, responseType: T.Type, onSuccess: @escaping NetworkSuccess, onFailure: @escaping NetworkFailure) where T : Decodable, T : Encodable {
        if shouldSucceed {
            onSuccess(returnedResponse)
        } else {
            onFailure(NetworkError.emptyResponse)
        }
    }
}
