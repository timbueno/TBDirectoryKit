//
//  UtilityInfoCell.swift
//  Bound
//
//  Created by Tim Bueno on 2015-09-14.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit


public protocol TBUtilityInfoCellDelegate: class {
    
    func utilityCellButtonPressed(_ sender: UIButton, inCell cell: TBUtilityInfoCell)
    
}


open class TBUtilityInfoCell: UITableViewCell {
    
    open weak var delegate: TBUtilityInfoCellDelegate?
    
    @IBOutlet open weak var actionButton: UIButton!
    @IBOutlet open weak var lineOneLabel: UILabel!
    @IBOutlet open weak var lineTwoLabel: UILabel!

    
    open override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    open override func prepareForReuse() {
        delegate = nil
    }

    open override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //
    // MARK: - IB Actions
    // ------------------------------------------------------------------------
    
    @IBAction open func utilityCellButtonPressed(_ sender: UIButton) {
        delegate?.utilityCellButtonPressed(sender, inCell: self)
    }
    
}
