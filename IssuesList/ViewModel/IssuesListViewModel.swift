//
//  IssuesListViewModel.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssuesListViewModel: NSObject {
    private let issuesList = [IssueViewModel]()
    
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
}

extension IssuesListViewModel: UITableViewDelegate {
    
}

