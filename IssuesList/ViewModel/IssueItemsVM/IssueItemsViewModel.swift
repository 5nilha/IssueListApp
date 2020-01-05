//
//  IssueItemsViewModel.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueItemsViewModel: NSObject {
    
    var items = [IssueItemViewModelProtocol]()
    
    init(issueVM: IssueViewModel?) {
        super.init()
        
        items.removeAll()
        
        guard let issue = issueVM else { return }
        let nameAndAvatarItem = IssueNameAndAvatarVM(name: issue.userName, avatarURL: issue.avatarURL, createdAt: issue.createdAt)
        items.append(nameAndAvatarItem)
        
        let titleItem = IssueTitleVM(title: issue.title)
        items.append(titleItem)
        
        let body = IssueBodyVM(body: issue.description)
        items.append(body)
    }
}

extension IssueItemsViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        
        switch item.type {
        case .nameAndAvatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IssueNameAndAvatarCell", for: indexPath) as! IssueNameAndAvatarCell
            cell.setupCell(item: item)
            return cell
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IssueTitleCell", for: indexPath) as! IssueTitleCell
            cell.setupCell(item: item)
            return cell
        case .body:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IssueBodyCell", for: indexPath) as! IssueBodyCell
            cell.setupCell(item: item)
            return cell
        }
    }
}

extension IssueItemsViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
