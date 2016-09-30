//
//  TBLoadingCell.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-11.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit

open class TBLoadingCell: UITableViewCell {
    
    @IBOutlet open weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet open weak var loadingLabel: UILabel!
    

    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    open func hideContents(_ hidden: Bool) {
        activityIndicator.isHidden = hidden
        loadingLabel.isHidden = hidden
    }

}
