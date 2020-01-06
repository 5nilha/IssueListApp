//
//  IssuesListViewModel.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

protocol IssuesListProtocol {
    func listDidUpdate()
    func didSelectIssue(issue: IssueViewModel)
    
}

class IssuesListViewModel: NSObject {
    private var issuesList = [IssueViewModel]()
    var delegate: IssuesListProtocol!
    
    override init() {
        super.init()
        WebServices.fetchIssues { [weak self] (issues) in
            guard let issues = issues else { return }
            self?.issuesList = issues
            
            DispatchQueue.main.async {
                if self?.delegate != nil {
                  self?.delegate.listDidUpdate()
                }
            }
        }
    }
    
    func testIssueListViewModel(issuesList: [IssueViewModel]) {
        self.issuesList = issuesList
        if self.delegate != nil {
            self.delegate.listDidUpdate()
        }
    }
    
    var numOfIssues: Int {
        return self.issuesList.count
    }
    
    func issueAtCell(indexPath: IndexPath) -> IssueViewModel {
        return issuesList[indexPath.row]
    }

}

extension IssuesListViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numOfIssues
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IssueCell.identifier, for: indexPath) as! IssueCell
        cell.setupCell(issue: issueAtCell(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let issue = issueAtCell(indexPath: indexPath)
        if self.delegate != nil {
            self.delegate.didSelectIssue(issue: issue)
        }
    }
}

extension IssuesListViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

