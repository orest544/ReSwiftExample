//
//  ListViewController.swift
//  ReduxUIKitDemo
//
//  Created by Orest Patlyka on 07.10.2020.
//

import UIKit

final class ListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var listTableView: UITableView!
    
    // MARK: - UI Properties
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshPulled), for: .valueChanged)
        return refresh
    }()
    
    // MARK: - Properties\
    
    private var users: [User] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.refreshControl = refreshControl
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if users.isEmpty {
            loadUsers()
        }
        if let selectedRow = listTableView.indexPathForSelectedRow {
            listTableView.deselectRow(at: selectedRow, animated: true)
        }
    }
    
    // MARK: - Actions
    
    @objc
    private func refreshPulled() {
        loadNewUser()
    }
    
    // MARK: - Methods
    
    private func loadUsers() {
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
    
    private func loadNewUser() {
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
}

// MARK: - TableView DataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}

// MARK: - TableView Delegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC: DetailsViewController = .make()
        detailsVC.selectedUser = users[indexPath.row]
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
