//
//  IssueNameAndAvatarVM.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueNameAndAvatarVM {
    var name: String!
    var avatarURL: String!
    var createdAt: String!
    
    init(name: String, avatarURL: String, createdAt: String) {
        self.name = name
        self.avatarURL = avatarURL
        self.createdAt = createdAt
    }
}

extension IssueNameAndAvatarVM: IssueItemViewModelProtocol {
    var type: IssueItemType {
        return .nameAndAvatar
    }
    
    var sectionTitle: String {
        return self.createdAt
    }
}
