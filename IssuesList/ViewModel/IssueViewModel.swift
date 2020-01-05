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
    
    init(title: String, description: String, avatarURL: String, createdAt: Date, state: String, issueURL: String) {
        //Read Issue from JSON USING ALAMOFILE
        self.issue = Issue(title: title, description: description, avatarURL: avatarURL, createdAt: createdAt, state: IssueState(rawValue: state)!, issueURL: issueURL)
    }
    
    var title: String {
        return self.issue.title
    }
    
    var description: String {
        return self.issue.description
    }
    
    var userAvatar: UIImage? {
        return UIImage(named: self.issue.avatarURL) ?? nil
    }
    
    var createdAt: String {
        return ""
    }
    
    var state: (status: String, color: UIColor) {
        
        let stateStatus = self.issue.state.rawValue.capitalized
        var stateViewColor: UIColor {
            switch issue.state {
            case .closed:
                return #colorLiteral(red: 0.7069504857, green: 0.5500190854, blue: 0.06280059367, alpha: 1)
            case .open:
                return #colorLiteral(red: 0, green: 0.3910211027, blue: 0.2461545467, alpha: 1)
            }
        }
        return (stateStatus, stateViewColor)
    }
    
    var issueLink: String {
        return self.issue.issueURL
    }
    
}
