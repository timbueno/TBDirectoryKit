//
//  TBDirectoryController.swift
//  TBDropbox
//
//  Created by Tim Bueno on 2015-08-03.
//  Copyright © 2015 Tim Bueno. All rights reserved.
//

import UIKit


let TBDirBundleIdentifier = "com.timbueno.TBDirectoryKit"

open class TBDirectoryController: UITableViewController, TBFileCellDelegate {
    
    open var subDirectoryController: TBDirectoryController!

    
    deinit {
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 66
        
        let fileCellNib = UINib(nibName: "TBFileCell", bundle: Bundle(identifier: TBDirBundleIdentifier))
        tableView.register(fileCellNib, forCellReuseIdentifier: "TBFileCell")
        
        let folderCellNib = UINib(nibName: "TBFolderCell", bundle: Bundle(identifier: TBDirBundleIdentifier))
        tableView.register(folderCellNib, forCellReuseIdentifier: "TBFolderCell")
        
        let loadingCellNib = UINib(nibName: "TBLoadingCell", bundle: Bundle(identifier: TBDirBundleIdentifier))
        tableView.register(loadingCellNib, forCellReuseIdentifier: "TBLoadingCell")
        
        let messageCellNib = UINib(nibName: "TBMessageCell", bundle: Bundle(identifier: TBDirBundleIdentifier))
        tableView.register(messageCellNib, forCellReuseIdentifier: "TBMessageCell")
        
        let utilityInfoCellNib = UINib(nibName: "TBUtilityInfoCell", bundle: Bundle(identifier: TBDirBundleIdentifier))
        tableView.register(utilityInfoCellNib, forCellReuseIdentifier: "TBUtilityInfoCell")
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        subDirectoryController = nil
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    open func actionButtonPressed(_ sender: UIButton, inCell cell: TBFileCell) {
        print("Pressed the action button!")
    }
    
}


extension TBDirectoryController {

    // MARK: - Table view data source

    override open func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if (indexPath as NSIndexPath).row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBLoadingCell", for: indexPath) as! TBLoadingCell
            cell.activityIndicator.startAnimating()
            return cell
        } else if (indexPath as NSIndexPath).row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBFolderCell", for: indexPath) as! TBFolderCell
            return cell
        } else if (indexPath as NSIndexPath).row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBFileCell", for: indexPath) as! TBFileCell
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TBMessageCell", for: indexPath) as! TBMessageCell
            return cell
        }
        
        
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (indexPath as NSIndexPath).row == 1 {
            let vc = TBDirectoryController()
            let count = navigationController?.viewControllers.count
            vc.title = "Ctrlr: \(count!)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
