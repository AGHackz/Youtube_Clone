//
//  OptionsLauncher.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 08/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

class OptionsLauncher: NSObject {
    
    var settings = [
        Settings(title: "Settings", icon: "settings"),
        Settings(title: "Terms & privacy policy", icon: "privacy"),
        Settings(title: "Send Feedback", icon: "chat"),
        Settings(title: "Help", icon: "help"),
        Settings(title: "Switch Account", icon: "account"),
        Settings(title: "Cancel", icon: "close")
    ]
    
    let cellHeight: CGFloat = 50
    static let cellId = "SettingsCell"
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissOptionsMenu)))
        return view
    }()
    
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        return cv
    }()
    
    override init() {
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SettingsCell.self, forCellWithReuseIdentifier: OptionsLauncher.cellId)
    }
    
    func openOptionsMenu() {
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(backgroundView)
            backgroundView.frame = window.frame
            window.addSubview(collectionView)
            collectionView.reloadData()
            backgroundView.alpha = 0
            
            let collectionViewHeight: CGFloat = (cellHeight * CGFloat(settings.count))
            let y = window.frame.height - collectionViewHeight
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: collectionViewHeight)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.backgroundView.alpha = 1
                self.collectionView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: collectionViewHeight)
            }, completion: { (success) in
                
            })
        }
    }
    
    @objc func dismissOptionsMenu() {
        if let window = UIApplication.shared.keyWindow {
            let collectionViewHeight: CGFloat = (cellHeight * CGFloat(settings.count))
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.backgroundView.alpha = 0
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: collectionViewHeight)
            }, completion: nil)
        }
    }
    
}

extension OptionsLauncher: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OptionsLauncher.cellId, for: indexPath) as! SettingsCell
        cell.setting = self.settings[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
