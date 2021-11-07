//
//  ViewController.swift
//  Stevia
//
//  Created by Gaston Seneza on 11/6/21.
//

import UIKit


class SteviaViewController: UIViewController {

    //MARK: - Properties
    let tableView = UITableView()
    fileprivate let reuseIdentifier = "reuseIdentifier"
    var issuesList: [SteviaIssues]?
    let steviaUrlPath = URLPath.getSteviaRepoPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CommentViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        navigationItem.title = "Stevia Issues ☕️"
        view.backgroundColor = .white
        setupTableView()
        fetchData(urlString: steviaUrlPath)

    }
    
    func fetchData(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }

            do {
                let issuesList = try JSONDecoder().decode([SteviaIssues].self, from: data)
                DispatchQueue.main.async {
                    self.issuesList = issuesList
                    self.tableView.reloadData()
                }
            } catch _ {
                
            }

        }.resume()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        //tableView.fillSuperview()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100

        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension SteviaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let issuesList = issuesList {
            return issuesList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CommentViewCell
        if let issuesList = issuesList {
            cell.comment = issuesList[indexPath.row]
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = issuesList[indexPath.row].title
            cell.textLabel?.numberOfLines = 0
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        let issues = issuesList?[indexPath.row]
        guard
            let title = issues?.title,
            let commentUrl = issues?.comments_url else { return }
        let destinationVC = CommentsDetailViewController(selectedItem: title, relatedItem: commentUrl)
        present(UINavigationController(rootViewController: destinationVC), animated: true)
    }
    
    
}

