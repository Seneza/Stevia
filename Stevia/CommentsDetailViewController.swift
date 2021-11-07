//
//  CommentsDetailViewController.swift
//  Stevia
//
//  Created by Gaston Seneza on 11/6/21.
//

import UIKit


class CommentsDetailViewController: UIViewController {
    private let selectedItem: String
    private let relatedItem: String
    private let padding: CGFloat = 16
    let commentLabel = UILabel(textColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), font: .boldSystemFont(ofSize: 14), numberOfLines: 0)
    var safeArea: UILayoutGuide!
    let dismissButton = UIButton()
    
    //MARK: - Custom Initialization
    init(selectedItem: String, relatedItem: String) {
        self.selectedItem = selectedItem
        self.relatedItem = relatedItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupCommentLabel()
        setupDismissButton()
    }
    
    //setup comment label
    private func setupCommentLabel() {
        view.addSubview(commentLabel)
        commentLabel.centerXInSuperview()
        commentLabel.centerYInSuperview()
        commentLabel.widthAnchor.constraint(equalToConstant: view.frame.width - padding * 2).isActive = true
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        for item in relatedItem {
            commentLabel.text = (commentLabel.text ?? "") + String(item)
        }
    }
   
    //dismiss comment view
    func setupDismissButton() {
        view.addSubview(dismissButton)
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    
    @objc func dismissAction() {
        self.dismiss(animated: true)
    }
}
