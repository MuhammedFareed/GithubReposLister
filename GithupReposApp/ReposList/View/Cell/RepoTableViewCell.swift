//
//  RepoTableViewCell.swift
//  GithupReposApp
//
//  Created by Muhammad Fareed on 14/05/2022.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet private weak var authorImageImageView: UIImageView!
    @IBOutlet private weak var repoNameLabel: UILabel!
    @IBOutlet private weak var repoAuthorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupStyles() {
        self.selectionStyle = .none
        authorImageImageView.layer.cornerRadius = authorImageImageView.bounds.height / 2 
    }

}
