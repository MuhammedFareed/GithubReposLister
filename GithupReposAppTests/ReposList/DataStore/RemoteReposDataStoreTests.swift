//
//  RemoteUserDataStoreTests.swift
//  GithupReposAppTests
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import XCTest
@testable import GithupReposApp

class RemoteReposDataStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchReposList_CallsSuccessClosureOnSuccess() {
        // Given
        let stubbedAPI = StubbedReposAPIClient()
        stubbedAPI.shouldSucceed = true
        stubbedAPI.returnedResponse = [
            Repo(name: "Repo 1", description: "bla bla", owner: Owner(login: "owner1", avatarUrl: "")),
            Repo(name: "Repo 2", description: "bla bla", owner: Owner(login: "owner2", avatarUrl: ""))
        ]
        var successCalled = false
        let sut = RemoteRepoDataStore(withAPIClient: stubbedAPI)
        
        // When
        sut.fetchReposList(onSuccess: { _ in successCalled = true }, onFailure: { _ in })
        
        // Then
        XCTAssertTrue(successCalled)
    }
    
    func testFetchReposList_CallsFailureClosureOnFailure() {
        // Given
        let stubbedAPI = StubbedReposAPIClient()
        stubbedAPI.shouldSucceed = false
        var failureCalled = false
        let sut = RemoteRepoDataStore(withAPIClient: stubbedAPI)
        
        // When
        sut.fetchReposList(onSuccess: { _ in }, onFailure: { _ in failureCalled = true })
        
        // Then
        XCTAssertTrue(failureCalled)
    }

}
