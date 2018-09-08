//
//  MenuBar.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 04/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    let cellId = "MenuCell"
    
    var imageNames = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImages(_ images: [String]) {
        self.imageNames = images
        self.collectionView.reloadData()
        if self.imageNames.count > 0 {
            let selectedIndexPath = IndexPath(row: 0, section: 0)
            self.collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .top)
        }
    }
    
    fileprivate func setupViews() {
        backgroundColor = UIColor.rgb(r: 230, g: 32, b: 31)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        self.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}

extension MenuBar: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.configCell(self.imageNames[indexPath.row])
        cell.tintColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.size.width / CGFloat(self.imageNames.count), height: self.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class MenuCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? .white : .black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? .white : .black
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
//        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, constant: 1).isActive = true
//        imageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    func configCell(_ imageName: String) {
        imageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
    }
    
}
