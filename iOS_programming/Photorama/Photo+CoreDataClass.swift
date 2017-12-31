//
//  Photo+CoreDataClass.swift
//  Photorama
//
//  Created by Shim Sooyeon on 2017. 12. 31..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Photo)
public class Photo: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    
    var image: UIImage?
    
    override public func awakeFromInsert() {
        super.awakeFromInsert()
        
        // 프로퍼티의 초기 값을 설정한다
        title = ""
        photoID = ""
        remoteURL = NSURL()
        photoKey = NSUUID().uuidString
        dateTaken = NSDate()
    }
    
    func addTagObject(tag: NSManagedObject) {
        let currentTags = mutableSetValue(forKey: "tags")
        currentTags.add(tag)
    }
    
    func removeTagObject(tag: NSManagedObject) {
        let currentTags = mutableSetValue(forKey: "tags")
        currentTags.remove(tag)
    }
    
}

