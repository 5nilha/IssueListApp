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
    
    init() {
        //Read Issue from JSON USING ALAMOFILE
        self.issue = Issue(title: "", description: "", avatarURL: "", createdAt: Date(), state: "", issueURL: "")
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
    
    var state: String {
        return self.issue.state
    }
    
    var issueLink: String {
        return self.issue.issueURL
    }
    
}
