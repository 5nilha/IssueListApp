//
//  MockIssues.swift
//  IssuesListTests
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation
@testable import IssuesList

struct MockIssuesJSON {
    static var data: [[String : Any?]?] {
        let JSONData: [[String : Any?]?] = [
            ["url": "https://api.github.com/repos/apple/swift/issues/29014",
              "repository_url": "https://api.github.com/repos/apple/swift",
              "labels_url": "https://api.github.com/repos/apple/swift/issues/29014/labels{/name}",
              "comments_url": "https://api.github.com/repos/apple/swift/issues/29014/comments",
              "events_url": "https://api.github.com/repos/apple/swift/issues/29014/events",
              "html_url": "https://github.com/apple/swift/pull/29014",
              "id": 545475796,
              "node_id": "MDExOlB1bGxSZXF1ZXN0MzU5MzQyODE2",
              "number": 29014,
              "title": "Add a pretty printer for small mode SmallBitVectors.",
              "user": [
                "login": "gottesmm",
                "id": 499423,
                "node_id": "MDQ6VXNlcjQ5OTQyMw==",
                "avatar_url": "https://avatars1.githubusercontent.com/u/499423?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/gottesmm",
                "html_url": "https://github.com/gottesmm",
                "followers_url": "https://api.github.com/users/gottesmm/followers",
                "following_url": "https://api.github.com/users/gottesmm/following{/other_user}",
                "gists_url": "https://api.github.com/users/gottesmm/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/gottesmm/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/gottesmm/subscriptions",
                "organizations_url": "https://api.github.com/users/gottesmm/orgs",
                "repos_url": "https://api.github.com/users/gottesmm/repos",
                "events_url": "https://api.github.com/users/gottesmm/events{/privacy}",
                "received_events_url": "https://api.github.com/users/gottesmm/received_events",
                "type": "User",
                "site_admin": false
              ],
              "labels": [

              ],
              "state": "open",
              "locked": false,
              "assignee": nil,
              "assignees": [

              ],
              "milestone": nil,
              "comments": 2,
              "created_at": "2020-01-05T22:28:57Z",
              "updated_at": "2020-01-05T22:29:11Z",
              "closed_at": nil,
              "author_association": "MEMBER",
              "pull_request": [
                "url": "https://api.github.com/repos/apple/swift/pulls/29014",
                "html_url": "https://github.com/apple/swift/pull/29014",
                "diff_url": "https://github.com/apple/swift/pull/29014.diff",
                "patch_url": "https://github.com/apple/swift/pull/29014.patch"
              ],
              "body": "Just something I cooked up really quickly b/c I needed it. If you want to use\r\nthis, lldb-with-tools will auto-import it, so I suggest that you use that.\r\n"
            ],
            ["url": "https://api.github.com/repos/apple/swift/issues/29011",
              "repository_url": "https://api.github.com/repos/apple/swift",
              "labels_url": "https://api.github.com/repos/apple/swift/issues/29011/labels{/name}",
              "comments_url": "https://api.github.com/repos/apple/swift/issues/29011/comments",
              "events_url": "https://api.github.com/repos/apple/swift/issues/29011/events",
              "html_url": "https://github.com/apple/swift/pull/29011",
              "id": 545362967,
              "node_id": "MDExOlB1bGxSZXF1ZXN0MzU5MjY3NzI2",
              "number": 29011,
              "title": "[Diagnostics] Handle CoerceExpr conversion failure in contextual mismatch",
              "user": [
                "login": "LucianoPAlmeida",
                "id": 8292651,
                "node_id": "MDQ6VXNlcjgyOTI2NTE=",
                "avatar_url": "https://avatars0.githubusercontent.com/u/8292651?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/LucianoPAlmeida",
                "html_url": "https://github.com/LucianoPAlmeida",
                "followers_url": "https://api.github.com/users/LucianoPAlmeida/followers",
                "following_url": "https://api.github.com/users/LucianoPAlmeida/following{/other_user}",
                "gists_url": "https://api.github.com/users/LucianoPAlmeida/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/LucianoPAlmeida/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/LucianoPAlmeida/subscriptions",
                "organizations_url": "https://api.github.com/users/LucianoPAlmeida/orgs",
                "repos_url": "https://api.github.com/users/LucianoPAlmeida/repos",
                "events_url": "https://api.github.com/users/LucianoPAlmeida/events{/privacy}",
                "received_events_url": "https://api.github.com/users/LucianoPAlmeida/received_events",
                "type": "User",
                "site_admin": false
              ],
              "labels": [

              ],
              "state": "closed",
              "locked": false,
              "assignee": nil,
              "assignees": [

              ],
              "milestone": nil,
              "comments": 3,
              "created_at": "2020-01-05T03:25:47Z",
              "updated_at": "2020-01-05T21:55:44Z",
              "closed_at": nil,
              "author_association": "CONTRIBUTOR",
              "pull_request": [
                "url": "https://api.github.com/repos/apple/swift/pulls/29011",
                "html_url": "https://github.com/apple/swift/pull/29011",
                "diff_url": "https://github.com/apple/swift/pull/29011.diff",
                "patch_url": "https://github.com/apple/swift/pull/29011.patch"
              ],
              "body": "While working in #27895, more specifically in https://github.com/apple/swift/pull/27895/commits/82529a6e7db2c46b86d8ede9bb520cfc112f8a6c I note that the cannot convert diagnostic for expr `Double(1) as Double as String` is being emitted via fix but still going re-typechecking passing through `CSDiag`. Note that actually when tried to put a `if (Options.contains(ConstraintSystemFlags::SubExpressionDiagnostics))` in `applySolutionFixes`.\r\nSo this PR is to handle coercion conversion error early on `repairFailures` and avoid this. \r\nThis also handles the TODO diagnostic in `test/type/subclass_composition.swift`.\r\n\r\ncc @xedin @hborla :))\r\n\r\n\r\n"
            ]
        ]
        
        return JSONData
    }
    
    
    static func readIssues() -> [IssueViewModel] {
        var issuesList = [IssueViewModel]()
        for dataIssue in MockIssuesJSON.data {
            let issue = IssueViewModel(dataJSON: dataIssue! as [String : Any])
            issuesList.append(issue)
        }
        return issuesList
    }
}
