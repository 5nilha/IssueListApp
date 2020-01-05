//
//  IssueItemViewModelProtocol.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

protocol IssueItemViewModelProtocol {
    var type: IssueItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
    var sectionHeaderHeight: CGFloat { get }
}

extension IssueItemViewModelProtocol {
    var rowCount: Int {
        return 1
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var sectionHeaderHeight: CGFloat {
        return 0
    }
}
