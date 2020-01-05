//
//  IssueTitleVM.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueTitleVM{
    let title: String

    init(title: String) {
        self.title = title
    }
}

extension IssueTitleVM: IssueItemViewModelProtocol {
    var type: IssueItemType {
        return .title
    }
    
    var sectionTitle: String {
        return "Título do Issue"
    }
}
