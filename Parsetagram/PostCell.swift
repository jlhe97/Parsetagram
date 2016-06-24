//
//  PostCell.swift
//  Parsetagram
//
//  Created by Juan Luis Herrero Estrada on 6/21/16.
//  Copyright © 2016 Juan Luis Herrero Estrada. All rights reserved.
//

import UIKit
import Parse
import ParseUI
class PostCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
