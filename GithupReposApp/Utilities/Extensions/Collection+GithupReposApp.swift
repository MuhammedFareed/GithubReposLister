//
//  Collection+GithupReposApp.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
            return indices.contains(index) ? self[index] : nil
    }
}
