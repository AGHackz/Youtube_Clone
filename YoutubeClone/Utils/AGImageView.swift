//
//  AGImageView.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 08/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

var agImageCacheDataStore = NSCache<AnyObject, AnyObject>()

class AGImageView: UIImageView {
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(fromUrl url: String) {
        if let image = agImageCacheDataStore.object(forKey: url as AnyObject) as? UIImage {
            self.image = image
            print("cache image is used")
        } else {
            DispatchQueue.global().async {
                if let imageUrl = URL(string: url) {
                    let urlRequest = URLRequest(url: imageUrl)
                    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                        DispatchQueue.main.async {
                            if let data = data {
                                if let imageToCache = UIImage(data: data) {
                                    agImageCacheDataStore.setObject(imageToCache, forKey: url as AnyObject)
                                    print("saved to cache")
                                    self.image = imageToCache
                                }
                            }
                        }
                    }
                    task.resume()
                }
            }
        }
    }
    
}

