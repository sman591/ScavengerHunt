//
//  ListViewController.swift
//  ScavengerHunt
//
//  Created by Stuart Olivera on 2/2/15.
//  Copyright (c) 2015 Stuart Olivera. All rights reserved.
//

import UIKit

class ListViewController:UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = .Camera
        } else{
            imagePicker.sourceType = .PhotoLibrary
        }
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let indexPath = tableView.indexPathForSelectedRow() {
            let selectedItem = itemsList[indexPath.row]
            let photo = info[UIImagePickerControllerOriginalImage] as UIImage
            selectedItem.photo = photo
            dismissViewControllerAnimated(true, completion: {
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            })
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        if item.iscomplete {
            cell.accessoryType = .Checkmark
            cell.imageView?.image = item.photo
        }
        else {
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        return cell
    }
}