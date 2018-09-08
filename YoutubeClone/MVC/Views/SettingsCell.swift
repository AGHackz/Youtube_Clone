//
//  SettingsCell.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 08/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    
    var setting: Settings? {
        didSet {
            lbl_title.text = setting?.title
            if let imgName = setting?.icon, let image = UIImage(named: imgName) {
                img_icon.image = image
            } else {
                img_icon.image = nil
            }
        }
    }
    
    var img_icon: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    var lbl_title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        img_icon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(img_icon)
        img_icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        img_icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        img_icon.widthAnchor.constraint(equalTo: img_icon.heightAnchor, multiplier: 1).isActive = true
        img_icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        
        lbl_title.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lbl_title)
        lbl_title.leadingAnchor.constraint(equalTo: img_icon.trailingAnchor, constant: 12).isActive = true
        lbl_title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 15).isActive = true
        lbl_title.centerYAnchor.constraint(equalTo: img_icon.centerYAnchor).isActive = true
    }
    
}
