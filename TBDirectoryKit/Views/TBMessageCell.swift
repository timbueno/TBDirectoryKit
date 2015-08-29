//
//  TBMessageCell.swift
//  TBDirectoryKit
//
//  Created by Tim Bueno on 2015-08-29.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit

public class TBMessageCell: UITableViewCell {
    
    
    @IBOutlet public weak var messageLabel: UILabel!
    

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setMessage(message: String) {
        messageLabel.text = message
    }

}
