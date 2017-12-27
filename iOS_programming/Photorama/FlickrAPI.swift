//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Shim Sooyeon on 2017. 12. 27..
//  Copyright © 2017년 Shim Sooyeon. All rights reserved.
//

import Foundation

enum Method: String {
    case RecentPhotos = "flickr.photos.getRecent"
}

enum PhotosResult {
    case Success([Photo])
    case Failure(Error)
}

enum FlickrError: Error {
    case InvalidJSONData
}

struct FlickrAPI {
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static let APIKey = "a6d819499131071f158fd740860a5a88"
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    private static func photoFromJSONObject(json: [String: AnyObject]) -> Photo? {
        guard let photoID = json["id"] as? String,
            let title = json["title"] as? String,
            let dateString = json["datetaken"] as? String,
            let photoURLString = json["url_h"] as? String,
            let url = NSURL(string: photoURLString),
            let dateTaken = dateFormatter.date(from: dateString) else {
                // Photo를 생성하기에 정보가 충분하지 않다.
                return nil
        }
        return Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: dateTaken as NSDate)
    }
    
    private static func flickrURL(method: Method, parameters: [String: String]?) -> NSURL {
        let components = NSURLComponents(string: baseURLString)!
        
        var queryItems = [NSURLQueryItem]()
        
        let baseParams = [
            "method": method.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": APIKey
        ]
        
        for (key, value) in baseParams {
            let item = NSURLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = NSURLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems as [URLQueryItem]
        
        return components.url! as NSURL
    }
    
    static func recentPhotosURL() -> NSURL {
        return flickrURL(method: .RecentPhotos, parameters: ["extras": "url_h, date_taken"])
    }
    
    static func photosFromJSONData(data: NSData) -> PhotosResult {
        do {
            let jsonObject: AnyObject = try JSONSerialization.jsonObject(with: data as Data, options: []) as AnyObject
            
            guard let jsonDictionary = jsonObject as? [NSObject: AnyObject],
                let photos = jsonDictionary["photos" as NSObject] as? [String: AnyObject],
                let photosArray = photos["photo"] as? [[String: AnyObject]] else {
                    // 일치하는 JSON 구조체가 없다
                    return .Failure(FlickrError.InvalidJSONData)
            }
            
            var finalPhotos = [Photo]()
            for photoJSON in photosArray {
                if let photo = photoFromJSONObject(json: photoJSON) {
                    finalPhotos.append(photo)
                }
            }
            
            if finalPhotos.count == 0 && photosArray.count > 0 {
                // photos에서 아무것도 파싱할 수 없다
                // photos의 JSON 포맷이 바뀌었을 수도 있다
                return .Failure(FlickrError.InvalidJSONData)
            }
            return .Success(finalPhotos)
        } catch let error {
            return .Failure(error)
        }
    }
}
