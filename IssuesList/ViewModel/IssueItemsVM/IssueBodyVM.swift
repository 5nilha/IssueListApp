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

    init(body: String) {
        self.body = body
    }
}

extension IssueBodyVM: IssueItemViewModelProtocol {
    var type: IssueItemType {
        return .body
    }
    
    var sectionTitle: String {
        return "Descrição"
    }
}
