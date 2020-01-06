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
                let issueVM = IssueViewModel(dataJSON: value)
                issues.append(issueVM)
            }
            completion(issues)
        }
    }
}
