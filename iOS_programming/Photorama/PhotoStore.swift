//
//  PhotoStore.swift
//  Photorama
//
//  Created by Shim Sooyeon on 2017. 12. 27..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import UIKit
import CoreData

enum ImageResult {
    case Success(UIImage)
    case Failure(Error)
}

enum PhotoError: Error {
    case ImageCreatoinError
}

class PhotoStore {
    let coreDataStack = CoreDataStack(modelName: "Photorama")
    let imageStore = ImageStore()
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func processRecentPhotosRequest(data data: NSData?, error: NSError?) -> PhotosResult {
        guard let jsonData = data else {
            return .Failure(error!)
        }
        return FlickrAPI.photosFromJSONData(data: jsonData, inContext: self.coreDataStack.privateQueueContext)
    }
    
    func fetchRecentPhotos(completion completion: @escaping (PhotosResult) -> Void) {
        let url = FlickrAPI.recentPhotosURL()
        let request = NSURLRequest(url: url as URL)
        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            
            var result = self.processRecentPhotosRequest(data: data as NSData?, error: error as NSError?)
            
            if case let .Success(photos) = result {
                let privateQueueContext = self.coreDataStack.privateQueueContext
                privateQueueContext.performAndWait({
                    try! privateQueueContext.obtainPermanentIDs(for: photos)
                })
                let objectIDs = photos.map{ $0.objectID }
                let predicate = NSPredicate(format: "self IN %@", objectIDs)
                let sortByDateTaken = NSSortDescriptor(key: "dateTaken", ascending: true)
                
                do {
                    try self.coreDataStack.saveChanges()
                    
                    let mainQueuePhotos = try self.fetchMainQueuePhotos(predicate: predicate, sortDescriptors: [sortByDateTaken])
                    result = .Success(mainQueuePhotos)
                } catch let error {
                    result = .Failure(error)
                }
            }
            completion(result)
        }
        task.resume()
    }
    
    func fetchImageForPhoto(photo: Photo, completion: @escaping (ImageResult) -> Void) {
        let photoKey = photo.photoKey
        if let image = imageStore.imageForKey(key: photoKey) {
            photo.image = image
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
                self.imageStore.setImage(image: image, forKey: photoKey)
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
    
    func fetchMainQueuePhotos(predicate predicate: NSPredicate? = nil,
                              sortDescriptors: [NSSortDescriptor]? = nil) throws -> [Photo] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.predicate = predicate
        
        let mainQueueContext = self.coreDataStack.mainQueueContext
        var mainQueuePhotos: [Photo]?
        var fetchRequestError: Error?
        mainQueueContext.performAndWait({
            do {
                mainQueuePhotos = try mainQueueContext(fetchRequest) as? [Photo]
            } catch let error {
                fetchRequestError = error
            }
        })
        
        guard let photos = mainQueuePhotos else {
            throw fetchRequestError!
        }
        
        return photos
    }
    
    func fetchMainQueueTags(predicate predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil)
        throws -> [NSManagedObject] {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Tag")
            fetchRequest.predicate = predicate
            fetchRequest.sortDescriptors = sortDescriptors
            
            let mainQueueContext = self.coreDataStack.mainQueueContext
            var mainQueueTags: [NSManagedObject]?
            var fetchRequestError: Error?
            mainQueueContext.performAndWait({
                do {
                    mainQueueTags = try mainQueueContext.execute(fetchRequest) as? [NSManagedObject]
                } catch let error {
                    fetchRequestError = error
                }
            })
            
            guard let tags = mainQueueTags else {
                throw fetchRequestError!
            }
            return tags
    }
}
