//
//  TBLoadingCell.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-11.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit

public class TBLoadingCell: UITableViewCell {
    
    @IBOutlet public weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet public weak var loadingLabel: UILabel!
    

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public func hideContents(hidden: Bool) {
        activityIndicator.hidden = hidden
        loadingLabel.hidden = hidden
    }

}
