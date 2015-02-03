//
//  ScavengerHuntItem.swift
//  ScavengerHunt
//
//  Created by Stuart Olivera on 2/2/15.
//  Copyright (c) 2015 Stuart Olivera. All rights reserved.
//

import Foundation
import UIKit

class ScavengerHuntItem: NSObject, NSCoding {
    let NameKey = "nameKey"
    let PhotoKey = "photoKey"
    
    let name: String
    var photo: UIImage?
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey(NameKey) as NSString
        self.photo = aDecoder.decodeObjectForKey(PhotoKey) as UIImage?
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: NameKey)
        if let thePhoto = photo {
            aCoder.encodeObject(photo, forKey: PhotoKey)
        }
    }
}