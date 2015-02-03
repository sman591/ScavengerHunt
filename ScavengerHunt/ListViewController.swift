//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Stuart Olivera on 2/2/15.
//  Copyright (c) 2015 Stuart Olivera. All rights reserved.
//

import UIKit

class ListViewController:UITableViewController {
    var itemsList = ["Cat", "Bird", "Brick"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = itemsList[indexPath.row]
        return cell
    }
}