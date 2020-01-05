//
//  Webservices.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation
import Alamofire

class WebServices {
    
    static func fetchIssues(completion: @escaping ([IssueViewModel]?) -> ()) {
        guard let url = URL(string: "https://api.github.com/repos/apple/swift/issues")
            else {
                completion(nil)
                return
        }
        
        AF.request(url).validate().responseJSON(queue: .global(qos: .utility), options: .mutableLeaves) { (response) in
            guard let values : [[String : Any]] = response.value as? [[String : Any]] else { return }
            
            var issues = [IssueViewModel]()
            for value in values {
                let body = value["body"] as? String ?? ""
                let title = value["title"] as? String ?? ""
                let createdAt = Date.stringDateToDate(stringDate: value["created_at"] as! String)
                let user = value["user"] as! [String : Any]
                let userName = user["login"] as? String ?? ""
                let avatar = user["avatar_url"] as? String ?? ""
                let state = value["state"] as? String ?? ""
                let issueURL = value["html_url"] as? String ?? ""
                
                let issueVM = IssueViewModel(title: title, description: body, userName: userName, avatarURL: avatar, createdAt: createdAt!, state: state, issueURL: issueURL)
                issues.append(issueVM)
            }
            completion(issues)
        }
        
    }
    
}
