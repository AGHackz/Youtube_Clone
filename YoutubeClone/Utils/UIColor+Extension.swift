//
//  UIColor+Extension.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 03/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
}
