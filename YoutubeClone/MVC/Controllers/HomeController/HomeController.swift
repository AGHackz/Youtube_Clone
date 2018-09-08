//
//  HomeController.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 02/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

private let reuseIdentifier = "VideoCell"

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos = [Video]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    var optionLauncher = OptionsLauncher()
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getVideosData()
        self.setupNavigationBar()
        collectionView?.backgroundColor = .white
        // Register cell classes
        collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        setupMenuBar()
    }
    
    private func getVideosData() {
        APIManager.sharedInstance.getVideos { (success, videos) in
            DispatchQueue.main.async {
                self.videos = videos
            }
        }
    }
    
    func setupNavigationBar() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: 44))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.titleView = titleLabel
        
        let searchBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(searchBarButtonPressed))
        searchBarButton.tintColor = .white
        let optionBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(optionBarButtonPressed))
        optionBarButton.tintColor = .white
        self.navigationItem.rightBarButtonItems = [optionBarButton, searchBarButton]
    }
    
    @objc func searchBarButtonPressed() {
        
    }
    
    @objc func optionBarButtonPressed() {
        optionLauncher.openOptionsMenu()
    }
    
    fileprivate func setupMenuBar() {
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        menuBar.setImages(["home", "fire", "playlist", "user"])
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VideoCell
        cell.video = self.videos[indexPath.row]
        // Configure the cell
        cell.configCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let extraHeight: CGFloat = 16 + 8 + 44 + 16
        let cellHeight: CGFloat = (view.frame.width * (9/16)) + extraHeight
        return CGSize(width: view.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class VideoCell: UICollectionViewCell {
    
    var video: Video? {
        didSet {
            updateUIData()
        }
    }
    
    lazy var img_videoThumb: AGImageView = {
        let imageView = AGImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var view_bottomSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    lazy var lbl_title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 248), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 252), for: .vertical)
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.text = "India vs Australia 2016 series | MS dhoni smashing sixes"
        return label
    }()
    
    lazy var lbl_description: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 2
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 252), for: .vertical)
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.text = "RBH SportsEra   .  3,798 views   .  4 days ago"
        return label
    }()
    
    lazy var img_userThumb: AGImageView = {
        let imageView = AGImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupThumbImageView() {
        contentView.addSubview(img_videoThumb)
        img_videoThumb.translatesAutoresizingMaskIntoConstraints = false
        img_videoThumb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        img_videoThumb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        img_videoThumb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        img_videoThumb.heightAnchor.constraint(equalTo: img_videoThumb.widthAnchor, multiplier: (9/16)).isActive = true
//        img_videoThumb.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.68).isActive = true
    }
    
    fileprivate func setupSeparatorView() {
        contentView.addSubview(view_bottomSeparator)
        view_bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        view_bottomSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view_bottomSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        view_bottomSeparator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        view_bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    fileprivate func setupUserThumbImageView() {
        contentView.addSubview(img_userThumb)
        img_userThumb.translatesAutoresizingMaskIntoConstraints = false
        img_userThumb.leadingAnchor.constraint(equalTo: img_videoThumb.leadingAnchor).isActive = true
        img_userThumb.topAnchor.constraint(equalTo: img_videoThumb.bottomAnchor, constant: 8).isActive = true
        img_userThumb.heightAnchor.constraint(equalToConstant: 44).isActive = true
        img_userThumb.widthAnchor.constraint(equalTo: img_userThumb.heightAnchor, multiplier: 1).isActive = true
    }
    
    fileprivate func setupTitleLabel() {
        contentView.addSubview(lbl_title)
        lbl_title.translatesAutoresizingMaskIntoConstraints = false
        lbl_title.leadingAnchor.constraint(equalTo: img_userThumb.trailingAnchor, constant: 8).isActive = true
        lbl_title.trailingAnchor.constraint(equalTo: img_videoThumb.trailingAnchor).isActive = true
        lbl_title.topAnchor.constraint(equalTo: img_userThumb.topAnchor).isActive = true
    }
    
    fileprivate func setupDescriptionLabel() {
        contentView.addSubview(lbl_description)
        lbl_description.translatesAutoresizingMaskIntoConstraints = false
        lbl_description.topAnchor.constraint(equalTo: lbl_title.bottomAnchor, constant: 4).isActive = true
        lbl_description.leadingAnchor.constraint(equalTo: lbl_title.leadingAnchor).isActive = true
        lbl_description.trailingAnchor.constraint(equalTo: lbl_title.trailingAnchor).isActive = true
        lbl_description.bottomAnchor.constraint(greaterThanOrEqualTo: view_bottomSeparator.topAnchor, constant: -16).isActive = true
    }
    
    func setupViews() {
        setupSeparatorView()
        setupThumbImageView()
        setupUserThumbImageView()
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func configCell() {
        setNeedsLayout()
        layoutIfNeeded()
        img_userThumb.makeCircular()
    }
    
    func updateUIData() {
        lbl_title.text = video?.title
        lbl_description.text = video?.getDescription()
        if let videoUrl = video?.thumbnail_image_name {
            img_videoThumb.setImage(fromUrl: videoUrl)
        } else {
            img_videoThumb.image = nil
        }
        if let userThumbUrl = video?.channel?.profile_image_name {
            img_userThumb.setImage(fromUrl: userThumbUrl)
        } else {
            img_userThumb.image = nil
        }
    }
    
}
