//
//  TBDirectoryController.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-03.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit


let TBDirBundleIdentifier = "com.timbueno.TBDirectoryKit"

public class TBDirectoryController: UITableViewController, TBFileCellDelegate {
    
    public var subDirectoryController: TBDirectoryController!

    
    deinit {
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 66
        
        let fileCellNib = UINib(nibName: "TBFileCell", bundle: NSBundle(identifier: TBDirBundleIdentifier))
        tableView.registerNib(fileCellNib, forCellReuseIdentifier: "TBFileCell")
        
        let folderCellNib = UINib(nibName: "TBFolderCell", bundle: NSBundle(identifier: TBDirBundleIdentifier))
        tableView.registerNib(folderCellNib, forCellReuseIdentifier: "TBFolderCell")
        
        let loadingCellNib = UINib(nibName: "TBLoadingCell", bundle: NSBundle(identifier: TBDirBundleIdentifier))
        tableView.registerNib(loadingCellNib, forCellReuseIdentifier: "TBLoadingCell")
        
        let messageCellNib = UINib(nibName: "TBMessageCell", bundle: NSBundle(identifier: TBDirBundleIdentifier))
        tableView.registerNib(messageCellNib, forCellReuseIdentifier: "TBMessageCell")
    }
    
    override public func viewWillAppear(animated: Bool) {
        subDirectoryController = nil
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func actionButtonPressed(sender: UIButton, inCell cell: TBFileCell) {
        print("Pressed the action button!")
    }
    
}


extension TBDirectoryController {

    // MARK: - Table view data source

    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TBLoadingCell", forIndexPath: indexPath) as! TBLoadingCell
            cell.activityIndicator.startAnimating()
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TBFolderCell", forIndexPath: indexPath) as! TBFolderCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TBFileCell", forIndexPath: indexPath) as! TBFileCell
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TBMessageCell", forIndexPath: indexPath) as! TBMessageCell
            return cell
        }
        
        
    }
    
    override public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 1 {
            let vc = TBDirectoryController()
            let count = navigationController?.viewControllers.count
            vc.title = "Ctrlr: \(count!)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
