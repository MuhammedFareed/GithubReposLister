//
//  ReposListViewController+TableView.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import Foundation
import UIKit

extension ReposListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preseneter?.numberOfRepos() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier) as! RepoTableViewCell
        cell.setupCell(withUIModel: preseneter?.repoUIModel(at: indexPath.row) ?? RepoUIModel(repoName: "", authorName: "", authorImageLink: ""))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
