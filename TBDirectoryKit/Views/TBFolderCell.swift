//
//  FolderCell.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-12.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit

open class TBFolderCell: UITableViewCell {
    
    @IBOutlet open weak var folderImage: UIImageView!
    @IBOutlet open weak var nameLabel: UILabel!
    
    open var indexPath: IndexPath?
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        folderImage.image = TBDirectoryIcons.imageOfFolderIcon(frame: CGRect(x: 0, y: 0, width: 30, height: 30), color: UIColor.black).withRenderingMode(.alwaysTemplate)
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override open func prepareForReuse() {
        nameLabel.text = ""
        indexPath = nil
    }

}
