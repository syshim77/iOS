//
//  PhotoStore.swift
//  Photorama
//
//  Created by Shim Sooyeon on 2017. 12. 27..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit

enum ImageResult {
    case Success(UIImage)
    case Failure(Error)
}

enum PhotoError: Error {
    case ImageCreatoinError
}

class PhotoStore {
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func processRecentPhotosRequest(data data: NSData?, error: NSError?) -> PhotosResult {
        guard let jsonData = data else {
            return .Failure(error!)
        }
        return FlickrAPI.photosFromJSONData(data: jsonData)
    }
    
    func fetchRecentPhotos(completion completion: @escaping (PhotosResult) -> Void) {
        let url = FlickrAPI.recentPhotosURL()
        let request = NSURLRequest(url: url as URL)
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            
            let result = self.processRecentPhotosRequest(data: data as NSData?, error: error as NSError?)
            completion(result)
        }
        task.resume()
    }
    
    func fetchImageForPhoto(photo: Photo, completion: @escaping (ImageResult) -> Void) {
        if let image = photo.image {
            completion(.Success(image))
            return
        }
        
        let photoURL = photo.remoteURL
        let request = NSURLRequest(url: photoURL as URL)
        
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            
            let result = self.processRecentPhotosRequest(data: data as NSData?, error: error as NSError?)
            
            if case let .Success(image) = result {
                photo.image = image
            }
            
            completion(result)
        }
        task.resume()
    }
    
    func processImageRequest(data data: NSData?, error: NSError?) -> ImageResult {
        guard let imageData = data,
            let image = UIImage(data: imageData as Data) else {
                // 이미지를 만들 수 없다
                if data == nil {
                    return .Failure(error!)
                } else {
                    return .Failure(PhotoError.ImageCreatoinError)
                }
        }
        return .Success(image)
    }
}
