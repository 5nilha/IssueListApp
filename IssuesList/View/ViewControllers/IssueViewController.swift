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
    
    static let viewControllerIdentifier = "IssueViewController"
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
        
        let dateView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width, height: 20)))
        
        let dateLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width, height: 20)))
        dateLabel.text = issueViewModel.createdAt
        dateLabel.textColor = .white
        dateLabel.font = .systemFont(ofSize: 14, weight: .medium)
        dateView.addSubview(dateLabel)
        
        self.navigationItem.titleView = dateView
    }
    
    @IBAction func openIssueOnWebClicked() {
        if let url = URL(string: issueViewModel.issueLink) {
            UIApplication.shared.open(url)
        }
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.issueItemsVM.tableView(tableView, viewForHeaderInSection: section)
    }

}
