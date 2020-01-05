//
//  IssueBodyVM.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueBodyVM{
    let body: String
    private let title: String

    init(title: String, body: String) {
        self.body = body
        self.title = title
    }
}

extension IssueBodyVM: IssueItemViewModelProtocol {
    var type: IssueItemType {
        return .body
    }
    
    var sectionTitle: String {
        return self.title
    }
    
    var sectionHeaderHeight: CGFloat {
        return 80
    }
}

