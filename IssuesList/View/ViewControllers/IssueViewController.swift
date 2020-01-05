//
//  IssueViewController.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var issueItemsVM: IssueItemsViewModel!
    var issueViewModel: IssueViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.issueItemsVM = IssueItemsViewModel(issueVM: issueViewModel)
        self.tableView.delegate = issueItemsVM
        self.tableView.dataSource = issueItemsVM
    }
}

extension IssueViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.issueItemsVM.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.issueItemsVM.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.issueItemsVM.tableView(tableView, cellForRowAt: indexPath)
    }

}
