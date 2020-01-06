//
//  IssueViewModel.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

struct IssueViewModel {
    private let issue: Issue
    
    init(dataJSON: [String : Any]) {
        let body = dataJSON["body"] as? String ?? ""
        let title = dataJSON["title"] as? String ?? ""
        let createdAt = Date.stringDateToDate(stringDate: dataJSON["created_at"] as! String)
        let user = dataJSON["user"] as! [String : Any]
        let userName = user["login"] as? String ?? ""
        let avatarURL = user["avatar_url"] as? String ?? ""
        let state = dataJSON["state"] as? String ?? ""
        let issueURL = dataJSON["html_url"] as? String ?? ""
        
        self.issue = Issue(title: title, description: body, userName: userName,  avatarURL: avatarURL, createdAt: createdAt!, state: IssueState(rawValue: state)!, issueURL: issueURL)
    }
    
    var title: String {
        return self.issue.title
    }
    
    var description: String {
        return self.issue.description
    }
    
    var userName: String {
        return self.issue.userName
    }
    
    var avatarURL: String {
        return self.issue.avatarURL
    }
    
    var createdAt: String {
        return self.issue.createdAt.formmatedDateForPortuguese
    }
    
    var state: (status: String, color: UIColor) {
        var stateStatus = ""
        switch issue.state {
        case .closed:
            stateStatus = "FECHADO"
            return (stateStatus, #colorLiteral(red: 0.7069504857, green: 0.5500190854, blue: 0.06280059367, alpha: 1))
        case .open:
            stateStatus = "ABERTO"
            return (stateStatus, #colorLiteral(red: 0, green: 0.3910211027, blue: 0.2461545467, alpha: 1))
        }
    }
    
    var issueLink: String {
        return self.issue.issueURL
    }
    
}
