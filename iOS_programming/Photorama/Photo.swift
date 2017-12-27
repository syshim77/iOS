//
//  Photo.swift
//  Photorama
//
//  Created by Shim Sooyeon on 2017. 12. 27..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class Photo {
    let title: String
    let remoteURL: NSURL
    let photoID: String
    let dateTaken: NSDate
    var image: UIImage?
    
    init(title: String, photoID: String, remoteURL: NSURL, dateTaken: NSDate) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
}
