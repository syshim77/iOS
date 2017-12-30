//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Shim Sooyeon on 2017. 12. 31..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }
    
    @NSManaged public var photoID: String
    @NSManaged public var photoKey: String
    @NSManaged public var title: String
    @NSManaged public var dateTaken: NSDate
    @NSManaged public var remoteURL: NSURL
    
}

