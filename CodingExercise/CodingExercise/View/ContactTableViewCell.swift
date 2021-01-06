//
//  ContactTableViewCell.swift
//  CodingExercise
//
//  Created by Nick Konieczko on 6/8/20.
//  Copyright © 2020 Rise Buildings. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Configure cell with data item
    func configureCell(_ contacts: ContactItem?) {
        self.userIcon?.downloaded(from: contacts?.image_url ?? "")
        self.userName.text = (contacts?.first_name ?? "") + " " + (contacts?.last_name ?? "")
        self.userTag.text = contacts?.tag_handle ?? ""
    }
}



