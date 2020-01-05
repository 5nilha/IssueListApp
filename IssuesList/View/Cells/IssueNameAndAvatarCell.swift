//
//  IssueNameAndAvatarCell.swift
//  IssuesList
//
//  Created by Fabio Quintanilha on 1/5/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class IssueNameAndAvatarCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    static let identifier = "IssueNameAndAvatarCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.height / 2
    }
    
    func setupCell(item: IssueItemViewModelProtocol) {
        guard let item = item as? IssueNameAndAvatarVM else { return }
        self.userNameLabel?.text = item.name
        
        let imageURL = URL(string: item.avatarURL)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
               if let image = UIImage(data: data) {
                   DispatchQueue.main.async {
                       self?.avatarImageView.image = image
                   }
               }
            }
        }
        
    }

}
