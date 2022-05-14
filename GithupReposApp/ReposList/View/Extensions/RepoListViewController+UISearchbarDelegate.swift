//
//  RepoListViewController+UISearchbarDelegate.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import UIKit

extension ReposListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        preseneter?.cancelSearch()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        preseneter?.searchForRepo(withSearchToken: searchBar.text ?? "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        preseneter?.searchForRepo(withSearchToken: searchText)
    }
}
