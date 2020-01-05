//
//  IssueItemViewModelProtocol.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

protocol IssueItemViewModelProtocol {
    var type: IssueItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

extension IssueItemViewModelProtocol {
    var rowCount: Int {
        return 1
    }
}
