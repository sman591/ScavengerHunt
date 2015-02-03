//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Stuart Olivera on 2/2/15.
//  Copyright (c) 2015 Stuart Olivera. All rights reserved.
//

import UIKit

class ListViewController:UITableViewController {
    var itemsList = [ScavengerHuntItem(name: "Cat"), ScavengerHuntItem(name: "Bird"), ScavengerHuntItem(name: "Brick")]
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "doneItemSegue" {
            let addItemController = segue.sourceViewController as AddViewController
            if let newItem = addItemController.newItem {
                itemsList += [newItem]
                let indexPath = NSIndexPath(forRow: itemsList.count-1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}