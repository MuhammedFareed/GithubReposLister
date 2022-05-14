//
//  ReposSearcherTests.swift
//  GithupReposAppTests
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import XCTest
@testable import GithupReposApp

class ReposSearcherTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearchByName_WhenTokenIsLessThanTwoChar_ReturnsWholeList() {
        // Given
        let repos = [
            Repo(name: "Repo 1", description: "bla bla", owner: Owner(login: "owner1", avatarUrl: "")),
            Repo(name: "Repo 2", description: "bla bla", owner: Owner(login: "owner2", avatarUrl: ""))
        ]
        let searchToken = "R"
        let sut = ReposSearcher()
        
        // When
        let result = sut.searchByName(withSearchToken: searchToken, inRepos: repos)
        
        XCTAssertEqual(result.count, repos.count)
    }
    
    func testSearchByName_WhenSearchTokenIsFound_ReturnsReposMatched() {
        // Given
        let repos = [
            Repo(name: "Repo 1", description: "bla bla", owner: Owner(login: "owner1", avatarUrl: "")),
            Repo(name: "Repo 2", description: "bla bla", owner: Owner(login: "owner2", avatarUrl: "")),
            Repo(name: "Meh", description: "bla bla", owner: Owner(login: "owner3", avatarUrl: ""))
        ]
        let searchToken = "Repo"
        let sut = ReposSearcher()
        
        // When
        let result = sut.searchByName(withSearchToken: searchToken, inRepos: repos)
        
        XCTAssertEqual(result.count, 2)
    }
    
    func testSearchByName_WhenSearchTokenIsNotFound_ReturnsEmptyList() {
        // Given
        let repos = [
            Repo(name: "Repo 1", description: "bla bla", owner: Owner(login: "owner1", avatarUrl: "")),
            Repo(name: "Repo 2", description: "bla bla", owner: Owner(login: "owner2", avatarUrl: ""))
        ]
        let searchToken = "ZZ"
        let sut = ReposSearcher()
        
        // When
        let result = sut.searchByName(withSearchToken: searchToken, inRepos: repos)
        
        XCTAssertEqual(result.count, 0)
    }

}
