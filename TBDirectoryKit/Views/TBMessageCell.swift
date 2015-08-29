//
//  TBMessageCell.swift
//  TBDirectoryKit
//
//  Created by Tim Bueno on 2015-08-29.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit

class TBMessageCell: UITableViewCell {
    
    
    @IBOutlet weak var messageLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMessage(message: String) {
        messageLabel.text = message
    }

}
