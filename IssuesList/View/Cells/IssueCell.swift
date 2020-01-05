//
//  IssueCell.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/4/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateView: UIView!
    
    static let identifier = "issueCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.numberOfLines = 0
        self.stateView.layer.cornerRadius = self.stateView.frame.height * 0.20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(issue: IssueViewModel) {
        self.titleLabel.text = issue.title
        self.stateLabel.text = issue.state.status
        self.stateView.backgroundColor = issue.state.color
    }
}
