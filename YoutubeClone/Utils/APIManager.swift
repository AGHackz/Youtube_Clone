//
//  APIManager.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 08/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import Foundation

class APIManager {
    
    static let sharedInstance = APIManager()
    
    func getVideos(completion: @escaping (_ success: Bool, _ videos: [Video]) -> Void) {
        let url = URL(string: "https://api.myjson.com/bins/vh68k")
        let urlRequest = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let videos = try jsonDecoder.decode([Video].self, from: data)
                        print("Response: \(videos)")
                        completion(true, videos)
                    } catch {
                        print("Parsing Error: \(error.localizedDescription)")
                        completion(false, [Video]())
                    }
                }
            } else {
                print("Network Error: \(String(describing: error?.localizedDescription))")
                completion(false, [Video]())
            }
        }
        task.resume()
    }
    
}
