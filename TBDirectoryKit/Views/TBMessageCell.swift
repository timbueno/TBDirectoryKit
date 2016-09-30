//
//  TBMessageCell.swift
//  TBDirectoryKit
//
//  Created by Tim Bueno on 2015-08-29.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit

open class TBMessageCell: UITableViewCell {
    
    
    @IBOutlet open weak var messageLabel: UILabel!
    

    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    open func setMessage(_ message: String) {
        messageLabel.text = message
    }

}
