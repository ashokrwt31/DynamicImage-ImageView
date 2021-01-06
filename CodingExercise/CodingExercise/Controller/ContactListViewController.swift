//
//  ViewController.swift
//  CodingExercise
//
//  Created by Nick Konieczko on 6/8/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import UIKit

let kContactTableViewCell = "ContactTableViewCell"

class ContactListViewController: UIViewController  {
    var contactViewModel: ContactViewModel?
    var contactAPI = ContantAPIClient()
    
    // MARK: - Initilize Table View
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UINib(nibName: kContactTableViewCell, bundle: nil), forCellReuseIdentifier: kContactTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.viewRespectsSystemMinimumLayoutMargins = false
        configureTableView()
        contactViewModel = ContactViewModel(contactAPI: contactAPI)
        contactViewModel?.getContactData { [weak self] in
            DispatchQueue.main.async() { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
}
// MARK: - Table View Delegate Methods
extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

// MARK: - Table View Data Source Methods
extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactViewModel?.contacts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kContactTableViewCell, for: indexPath) as! ContactTableViewCell
        cell.configureCell(self.contactViewModel?.contacts[indexPath.row] ?? nil)
        return cell
    }
 }
