//
//  IssuesListTests.swift
//  IssuesListTests
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Quick
import Nimble

@testable import IssuesList

class IssuesListTests: QuickSpec {
    
   override func spec() {
        var subject: IssuesListViewController!
        
        describe("IssuesListViewControllerSpec") {
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: IssuesListViewController.viewControllerIdentifier) as? IssuesListViewController
                _ = subject.view
                subject.issuesListVM.testIssueListViewModel(issuesList: MockIssuesJSON.readIssues())
            }
            
            context("when view is loaded") {
                it("should have 2 issues loaded") {
                    expect(subject.tableView.numberOfRows(inSection: 0)).to(equal(MockIssuesJSON.data.count))
                }
            }
            
            
            //Testing the Issue Cell for open and closed state
            context("Table View") {
                var cell: IssueCell!
                
                it("should show issue title and state") {
                    
                    for index in 0..<subject.issuesListVM.numOfIssues {
                        
                        cell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: index, section: 0)) as? IssueCell
                        let issue = subject.issuesListVM.issueAtCell(indexPath: IndexPath(row: index, section: 0))
                        expect(cell.titleLabel.text).to(equal(issue.title))
                        expect(cell.stateLabel.text).to(equal(issue.state.status))
                        expect(cell.stateView.backgroundColor).to(equal(issue.state.color))
                    }
                 }
            }
        }
    }
}
