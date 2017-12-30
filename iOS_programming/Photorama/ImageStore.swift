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
        
        // 이미지의 전체 URL을 만든다
        let imageURL = imageURLForKey(key: key)
        
        // 이미지를 JPEG 데이터로 만든다
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            // 이 데이터를 전체 URL에 쓴다
            do {
                try data.write(to: imageURL as URL, options: .atomic)
            } catch {
                print(error)
            }
        }
    }
    
    func imageForKey(key: String) -> UIImage? {
        if let existingImage = cache.object(forKey: key as AnyObject) as? UIImage {
            return existingImage
        }
        
        let imageURL = imageURLForKey(key: key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!)
            else {
                return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key as AnyObject)
        return imageFromDisk
    }
    
    func deleteImageForKey(key: String) {
        cache.removeObject(forKey: key as AnyObject)
        
        let imageURL = imageURLForKey(key: key)
        do {
            try FileManager.default.removeItem(at: imageURL as URL)
        } catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }
    
    func imageURLForKey(key: String) -> NSURL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent(key) as NSURL
    }
}
