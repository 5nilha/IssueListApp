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
    
    init(title: String, description: String, userName: String, avatarURL: String, createdAt: Date, state: String, issueURL: String) {
        //Read Issue from JSON USING ALAMOFILE
        self.issue = Issue(title: title, description: description, userName: userName,  avatarURL: avatarURL, createdAt: createdAt, state: IssueState(rawValue: state)!, issueURL: issueURL)
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
