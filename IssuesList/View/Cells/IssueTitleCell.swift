//
//  IssueTitleCell.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueTitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "IssueTitleCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.numberOfLines = 0
    }

    func setupCell(item: IssueItemViewModelProtocol) {
        guard let item = item as? IssueTitleVM else { return }
        self.titleLabel?.text = item.title
    }

}
