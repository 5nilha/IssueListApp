//
//  Issue.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

enum IssueState: String {
    case closed
    case open
}

struct Issue {
    let title: String
    let description: String
    let avatarURL: String
    let createdAt: Date
    let state: IssueState
    let issueURL: String
}
