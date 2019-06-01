//
//  TBFileCell.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-04.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit


public protocol TBFileCellDelegate: class {
    
    func actionButtonPressed(_ sender: UIButton, inCell cell: TBFileCell)
    
}


open class TBFileCell: UITableViewCell {
    
    open weak var delegate: TBFileCellDelegate?
    
    open var indexPath: IndexPath?
    
    @IBOutlet open weak var fileNameLabel: UILabel!
    @IBOutlet open weak var detailLabel: UILabel!
    @IBOutlet open weak var actionButton: UIButton!
    @IBOutlet open weak var circleProgressView: CircleProgressView!
    
    public enum DownloadState {
        case unknown
        case waiting
        case downloading
        case paused
        case finished
        case cancelled
        case failed
    }
    open var downloadState = DownloadState.unknown {
        didSet {
            configureActionButtonForState(downloadState)
        }
    }
    

    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUnknownState()
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override open func prepareForReuse() {
        configureUnknownState()
        fileNameLabel.text = ""
        detailLabel.text = ""
        indexPath = nil
    }
    
    
    open func configureActionButtonForState(_ state: TBFileCell.DownloadState) {
        switch state {
        case .unknown:
            configureUnknownState()
        case .waiting:
            configureWaitingState()
        case .downloading:
            configureDownloadingState()
        case .paused:
            configurePausedState()
        case .finished:
            configureFinishedState()
        case .cancelled:
            configureCancelledState()
        case .failed:
            configureFailedState()
        }
    }
    
    
    //
    // MARK: - Download State Images
    // ------------------------------------------------------------------------
    
    open func imageForDownload() -> UIImage {
        return TBDirectoryIcons.imageOfDownloadIcon(frame: CGRect(x: 0, y: 0, width: 25, height: 25), color: UIColor.black)
    }
    
    open func imageForWaiting() -> UIImage {
        return TBDirectoryIcons.imageOfInProgressIcon(frame: CGRect(x: 0, y: 0, width: 15, height: 15), color: UIColor.black)
    }
    
    open func imageForPause() -> UIImage {
        return TBDirectoryIcons.imageOfPauseIcon(frame: CGRect(x: 0, y: 0, width: 10, height: 10), color: UIColor.black)
    }
    
    open func imageForResume() -> UIImage {
        return TBDirectoryIcons.imageOfDownloadIcon(frame: CGRect(x: 0, y: 0, width: 15, height: 15), color: UIColor.black)
    }
    
    open func imageForFinished() -> UIImage {
        return TBDirectoryIcons.imageOfCompleteIcon(frame: CGRect(x: 0, y: 0, width: 35, height: 35), color: UIColor.black)
    }
    
    open func imageForCancelled() -> UIImage {
        return TBDirectoryIcons.imageOfDownloadIcon(frame: CGRect(x: 0, y: 0, width: 25, height: 25), color: UIColor.black)
    }
    
    open func imageForFailed() -> UIImage {
        return TBDirectoryIcons.imageOfCautionIcon(frame: CGRect(x: 0, y: 0, width: 25, height: 25), color: UIColor.black)
    }
    
    
    //
    // MARK: - Download State Setup
    // ------------------------------------------------------------------------
    
    func configureUnknownState() {
        setActionButtonImage(imageForDownload())
        circleProgressView.isHidden = true
        setProgress(0.0)
    }
    
    func configureWaitingState() {
        setActionButtonImage(imageForWaiting())
        circleProgressView.isHidden = false
    }
    
    func configureDownloadingState() {
        setActionButtonImage(imageForPause())
        circleProgressView.isHidden = false
    }
    
    func configurePausedState() {
        setActionButtonImage(imageForResume())
        circleProgressView.isHidden = false
    }
    
    func configureFinishedState() {
        setActionButtonImage(imageForFinished())
        setProgress(1.0)
        circleProgressView.isHidden = true
    }
    
    func configureCancelledState() {
        circleProgressView.isHidden = false
        setProgress(0.0)
    }
    
    func configureFailedState() {
        setActionButtonImage(imageForFailed())
        circleProgressView.isHidden = true
    }
    
    
    //
    // MARK: - Component Configuration
    // ------------------------------------------------------------------------
    
    open func setActionButtonImage(_ image: UIImage) {
        actionButton.setImage(UIImage.addBorder(frame: actionButton.frame, image: image), for: UIControl.State())
    }
    
    
    open func setProgress(_ progress: Double) {
        circleProgressView.progress = progress
    }
    
    
    //
    // MARK: - IB Actions
    // ------------------------------------------------------------------------
    
    @IBAction open func actionButtonPressed(_ sender: UIButton) {
        delegate?.actionButtonPressed(sender, inCell: self)
    }

}
