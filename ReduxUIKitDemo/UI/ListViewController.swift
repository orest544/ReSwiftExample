//
//  ListViewController.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit

struct User {
    let name: String
    let age: Int
}

extension User {
    init(userResponse: UserResponse) {
        name = userResponse.name ?? "Unknown"
        age = userResponse.age ?? 0
    }
}

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var listTableView: UITableView!
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshPulled), for: .valueChanged)
        return refresh
    }()
    
    private var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.refreshControl = refreshControl
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        listTableView.refreshControl?.beginRefreshingAutomatically()
        APIClient.getUsers { [weak self] result in
            switch result {
            case .success(let usersResponse):
                DispatchQueue.main.async {
                    self?.users = usersResponse.data.map { User(userResponse: $0) }
                    self?.listTableView.reloadData()
                    self?.listTableView.refreshControl?.endRefreshing()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc
    private func refreshPulled() {
        APIClient.getNewUser { [weak self] result in
            switch result {
            case .success(let userResponse):
                DispatchQueue.main.async {
                    self?.users.append(User(userResponse: userResponse))
                    self?.listTableView.reloadData()
                    self?.listTableView.refreshControl?.endRefreshing()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    // MARK: - TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC: DetailsViewController = .make()
        detailsVC.selectedUser = users[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
