//
//  IssuesListViewController.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssuesListViewController: UIViewController, IssuesListProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    static let viewControllerIdentifier = "IssuesListViewController"
    var issuesListVM: IssuesListViewModel!
    private var selectedIssue: IssueViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.issuesListVM = IssuesListViewModel()
        self.issuesListVM.delegate = self
        self.tableView.delegate = issuesListVM
        self.tableView.dataSource = issuesListVM
        
        self.navigationItem.title = "Apple Swift Issues"
    }
    
    func listDidUpdate() {
        self.tableView.reloadData()
    }
    
    func didSelectIssue(issue: IssueViewModel) {
        self.selectedIssue = issue
        performSegue(withIdentifier: "goToIssueSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToIssueSegue" {
            let destination = segue.destination as! IssueViewController
            destination.issueViewModel = self.selectedIssue
        }
    }
}

extension IssuesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issuesListVM.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return issuesListVM.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.issuesListVM.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return issuesListVM.tableView(tableView, heightForRowAt: indexPath)
    }
}
