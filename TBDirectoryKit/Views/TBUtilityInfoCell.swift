//
//  UtilityInfoCell.swift
//  Bound
//
//  Created by Tim Bueno on 2015-09-14.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit


public protocol TBUtilityInfoCellDelegate: class {
    
    func utilityCellButtonPressed(sender: UIButton, inCell cell: TBUtilityInfoCell)
    
}


public class TBUtilityInfoCell: UITableViewCell {
    
    public weak var delegate: TBUtilityInfoCellDelegate?
    
    @IBOutlet public weak var actionButton: UIButton!
    @IBOutlet public weak var lineOneLabel: UILabel!
    @IBOutlet public weak var lineTwoLabel: UILabel!

    
    public override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .None
    }
    
    public override func prepareForReuse() {
        delegate = nil
    }

    public override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //
    // MARK: - IB Actions
    // ------------------------------------------------------------------------
    
    @IBAction public func utilityCellButtonPressed(sender: UIButton) {
        delegate?.utilityCellButtonPressed(sender, inCell: self)
    }
    
}
