//
//  FolderCell.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-12.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit

public class TBFolderCell: UITableViewCell {
    
    @IBOutlet public weak var folderImage: UIImageView!
    @IBOutlet public weak var nameLabel: UILabel!
    

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        folderImage.image = TBDirectoryIcons.imageOfFolderIcon(frame: CGRectMake(0, 0, 30, 30), color: UIColor.blackColor())
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
