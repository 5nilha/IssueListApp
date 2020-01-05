//
//  IssuesListViewController.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssuesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var issuesListVM: IssuesListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.issuesListVM = IssuesListViewModel()
        self.tableView.delegate = issuesListVM
        self.tableView.dataSource = issuesListVM
    }
}

extension IssuesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issuesListVM.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return issuesListVM.tableView(tableView, cellForRowAt: indexPath)
    }
}
