//
//  ImageStore.swift
//  Homepwner
//
//  Created by Shim Sooyeon on 2017. 11. 14..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit
class ImageStore {
    let cache = NSCache<AnyObject, AnyObject>()
    
    func setImage(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as AnyObject)
    }
    
    func imageForKey(key: String) -> UIImage? {
        return cache.object(forKey: key as AnyObject) as? UIImage
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObject(forKey: key as AnyObject)
    }
}
