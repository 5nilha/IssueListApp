//
//  IssueVCTest.swift
//  IssuesListTests
//
//  Created by Fabio Quintanilha on 1/6/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Quick
import Nimble

@testable import IssuesList

class IssueVCTest: QuickSpec {
    
   override func spec() {
        var listVC: IssuesListViewController!
        var subject: IssueViewController!
        
        describe("IssueViewControllerSpec") {
            beforeEach {
                listVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: IssuesListViewController.viewControllerIdentifier) as? IssuesListViewController
                _ = listVC.view
                listVC.issuesListVM.testIssueListViewModel(issuesList: MockIssuesJSON.readIssues())
            }
            
            context("when view is loaded") {
                it("should have 2 issues loaded") {
                    expect(listVC.tableView.numberOfRows(inSection: 0)).to(equal(MockIssuesJSON.data.count))
                }
            }
            
            context("did select issue at each indexpath") {
                var listCell: IssueCell!
                var issuenameAndAvatarCell: IssueNameAndAvatarCell!
                var issueBodyCell: IssueBodyCell!
                beforeEach {
                    for index in 0..<listVC.issuesListVM.numOfIssues {

                        listCell = listVC.tableView(subject.tableView, cellForRowAt: IndexPath(row: index, section: 0)) as? IssueCell
                        let issue = listVC.issuesListVM.issueAtCell(indexPath: IndexPath(row: index, section: 0))

                        subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: IssueViewController.viewControllerIdentifier) as? IssueViewController
                        _ = subject.view
                        subject.issueViewModel = issue

                        context("when view is loaded") {
                            it("should have 2 sections loaded") {
                                expect(subject.tableView.numberOfSections).to(equal(2))
                            }
                        }

                        it("should have 2 cells loaded") {
                            issuenameAndAvatarCell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? IssueNameAndAvatarCell
                            expect(issuenameAndAvatarCell.userNameLabel.text).to(equal(issue.userName))
                            XCTAssertTrue(issuenameAndAvatarCell.avatarImageView != nil)

                            issueBodyCell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? IssueBodyCell
                            expect(issueBodyCell.bodyLabel.text).to(equal(issue.description))
                        }
                    }
                }

            }
        }
    }
}
