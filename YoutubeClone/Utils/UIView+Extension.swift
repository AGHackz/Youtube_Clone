//
//  UIView+Extension.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 02/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillSuperView(superView: UIView, edgeInsets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: edgeInsets.left).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: edgeInsets.right).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor, constant: edgeInsets.top).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: edgeInsets.bottom).isActive = true
        
    }
    
    func makeCircular() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
}
