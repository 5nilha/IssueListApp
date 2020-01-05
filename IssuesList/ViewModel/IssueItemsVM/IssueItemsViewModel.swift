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
        
        let body = IssueBodyVM(title: issue.title, body: issue.description)
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let item = items[section]
        return item.sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let item = items[section]
        
        switch item.type {
        case .nameAndAvatar:
            return nil
        case .body:
            let headerView = setHeaderView(tableView: tableView, height: item.sectionHeaderHeight, color: .systemGroupedBackground, title: item.sectionTitle)
            return headerView
        }
        
    }
    
    private func setHeaderView(tableView: UITableView, height: CGFloat, color: UIColor, title: String) -> UIView {
        let headerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: tableView.bounds.width, height: height)))
        headerView.backgroundColor = color
        
        let titleLabel = UILabel(frame: CGRect(origin: .init(x: 20, y: 0), size: CGSize(width: headerView.bounds.width - 40, height: headerView.bounds.height)))
        
        titleLabel.textColor = .black
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        titleLabel.numberOfLines = 0
        headerView.addSubview(titleLabel)
                
        return headerView
    }
}
