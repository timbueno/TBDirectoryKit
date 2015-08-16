//
//  TBFileCell.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-04.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit


public protocol TBFileCellDelegate: class {
    
    func actionButtonPressed(sender: UIButton, inCell cell: TBFileCell)
    
}


public class TBFileCell: UITableViewCell {
    
    public weak var delegate: TBFileCellDelegate?
    
    @IBOutlet public weak var fileNameLabel: UILabel!
    @IBOutlet public weak var detailLabel: UILabel!
    @IBOutlet public weak var actionButton: UIButton!
    @IBOutlet public weak var circleProgressView: CircleProgressView!
    
    public enum DownloadState {
        case Unknown
        case Waiting
        case Downloading
        case Paused
        case Finished
        case Cancelled
        case Failed
    }
    public var downloadState = DownloadState.Unknown {
        didSet {
            configureActionButtonForState(downloadState)
        }
    }
    

    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUnknownState()
    }

    override public func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override public func prepareForReuse() {
        configureUnknownState()
        fileNameLabel.text = ""
        detailLabel.text = ""
    }
    
    
    public func configureActionButtonForState(state: TBFileCell.DownloadState) {
        switch state {
        case .Unknown:
            configureUnknownState()
        case .Waiting:
            configureWaitingState()
        case .Downloading:
            configureDownloadingState()
        case .Paused:
            configurePausedState()
        case .Finished:
            configureFinishedState()
        case .Cancelled:
            configureCancelledState()
        case .Failed:
            configureFailedState()
        }
    }
    
    
    //
    // MARK: - Download State Images
    // ------------------------------------------------------------------------
    
    public func imageForDownload() -> UIImage {
        return TBDirectoryIcons.imageOfDownloadIcon(frame: CGRectMake(0, 0, 25, 25), color: UIColor.blackColor())
    }
    
    public func imageForWaiting() -> UIImage {
        return TBDirectoryIcons.imageOfInProgressIcon(frame: CGRectMake(0, 0, 15, 15), color: UIColor.blackColor())
    }
    
    public func imageForPause() -> UIImage {
        return TBDirectoryIcons.imageOfPauseIcon(frame: CGRectMake(0, 0, 10, 10), color: UIColor.blackColor())
    }
    
    public func imageForResume() -> UIImage {
        return TBDirectoryIcons.imageOfDownloadIcon(frame: CGRectMake(0, 0, 15, 15), color: UIColor.blackColor())
    }
    
    public func imageForFinished() -> UIImage {
        return TBDirectoryIcons.imageOfCompleteIcon(frame: CGRectMake(0, 0, 35, 35), color: UIColor.blackColor())
    }
    
    public func imageForCancelled() -> UIImage {
        return TBDirectoryIcons.imageOfDownloadIcon(frame: CGRectMake(0, 0, 25, 25), color: UIColor.blackColor())
    }
    
    public func imageForFailed() -> UIImage {
        return TBDirectoryIcons.imageOfCautionIcon(frame: CGRectMake(0, 0, 25, 25), color: UIColor.blackColor())
    }
    
    
    //
    // MARK: - Download State Setup
    // ------------------------------------------------------------------------
    
    func configureUnknownState() {
        setActionButtonImage(imageForDownload())
        circleProgressView.hidden = true
        setProgress(0.0)
    }
    
    func configureWaitingState() {
        setActionButtonImage(imageForWaiting())
        circleProgressView.hidden = false
    }
    
    func configureDownloadingState() {
        setActionButtonImage(imageForPause())
        circleProgressView.hidden = false
    }
    
    func configurePausedState() {
        setActionButtonImage(imageForResume())
        circleProgressView.hidden = false
    }
    
    func configureFinishedState() {
        setActionButtonImage(imageForFinished())
        setProgress(1.0)
        circleProgressView.hidden = true
    }
    
    func configureCancelledState() {
        circleProgressView.hidden = false
        setProgress(0.0)
    }
    
    func configureFailedState() {
        setActionButtonImage(imageForFailed())
        circleProgressView.hidden = true
    }
    
    
    //
    // MARK: - Component Configuration
    // ------------------------------------------------------------------------
    
    public func setActionButtonImage(image: UIImage) {
        actionButton.setImage(UIImage.addBorder(frame: actionButton.frame, image: image), forState: .Normal)
    }
    
    
    public func setProgress(progress: Double) {
        circleProgressView.progress = progress
    }
    
    
    //
    // MARK: - IB Actions
    // ------------------------------------------------------------------------
    
    @IBAction public func actionButtonPressed(sender: UIButton) {
        delegate?.actionButtonPressed(sender, inCell: self)
    }

}
