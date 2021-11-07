//
//  CommentViewCell.swift
//  Stevia
//
//  Created by Gaston Seneza on 11/6/21.
//

import UIKit


class CommentViewCell: UITableViewCell {
    
    //MARK: -- Computed property
    
    var comment: SteviaIssues? {
        didSet {
            guard let commentItem = comment else { return }
            if let title = commentItem.title {
                commentLabel.text = title
            }
        }
    }
    
    //MARK: - create issue comment Label
    let commentLabel: UILabel = {
        let label = UILabel(textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), font: .boldSystemFont(ofSize: 14))
        label.fillSuperview()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
