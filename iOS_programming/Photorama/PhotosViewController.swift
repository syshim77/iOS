//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Shim Sooyeon on 2017. 12. 27..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchRecentPhotos() {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .Success(photos):
                print("Successfully found \(photos.count) recent photos.")
                
                if let firstPhoto = photos.first {
                    self.store.fetchImageForPhoto(photo: firstPhoto) {
                        (ImageResult) -> Void in
                        
                        switch ImageResult {
                        case let .Success(image):
                            OperationQueue.main.addOperation {
                                self.imageView.image = image
                            }
                        case let .Failure(error):
                            print("Error downloading image: \(error)")
                        }
                    }
                }
            case let .Failure(error):
                print("Error fetching recent photos: \(error)")
            }
        }
    }
}
