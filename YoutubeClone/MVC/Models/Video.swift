//
//  Video.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 08/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import Foundation

class Video: Codable {
    
    var title: String?
    var number_of_views: Int?
    var thumbnail_image_name: String?
    var channel: Channel?
    var duration: Int?
    
    func getDescription() -> String? {
        if let channelName = channel?.name, let viewsCount = number_of_views {
            return "\(channelName) • \(viewsCount)"
        }
        return nil
    }
    
}
