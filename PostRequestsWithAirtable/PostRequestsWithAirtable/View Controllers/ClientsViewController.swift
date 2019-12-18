//
//  ClientsViewController.swift
//  PostRequestsWithAirtable
//
//  Created by Kelby Mittan on 12/18/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ClientsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var projectsTableView: UITableView!
    
    // MARK: - Private Properties
    
    private var clients = [Client]() {
        didSet {
            projectsTableView.reloadData()
        }
    }
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func configureTableView() {
        projectsTableView.delegate = self
        projectsTableView.dataSource = self
    }
    
    private func loadData() {
        ProjectAPIClient.manager.getClients { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case let .success(clients):
                    self?.clients = clients
                case let .failure(error):
                    self?.displayErrorAlert(with: error)
                }
            }
        }
    }
    
    private func displayErrorAlert(with error: AppError) {
        let alertVC = UIAlertController(title: "Error Fetching Data", message: "\(error)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}

extension ClientsViewController: UITableViewDelegate {}

extension ClientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let client = clients[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath)
        cell.textLabel?.text = client.Name 
//        cell.detailTextLabel?.text = project.dueDate.description
        return cell
    }
}
