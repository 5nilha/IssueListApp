//
//  IssueBodyCell.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueBodyCell: UITableViewCell {

    @IBOutlet weak var bodyLabel: UILabel!
    static let identifier = "IssueBodyCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bodyLabel.numberOfLines = 0
    }

    func setupCell(item: IssueItemViewModelProtocol) {
        guard let item = item as? IssueBodyVM else { return }
        self.bodyLabel?.text = item.body
    }

}
