//
//  AppDelegate.swift
//  YoutubeClone
//
//  Created by Ankit Gupta on 02/09/18.
//  Copyright © 2018 Ankit Gupta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        UINavigationBar.appearance().barTintColor = UIColor.rgb(r: 230, g: 32, b: 31)
        application.statusBarStyle = .lightContent
        
//        let statusBarBGView = UIView()
//        statusBarBGView.backgroundColor = UIColor.rgb(r: 194, g: 31, b: 31)
//        window?.addSubview(statusBarBGView)
//        statusBarBGView.translatesAutoresizingMaskIntoConstraints = false
//        statusBarBGView.leadingAnchor.constraint(equalTo: (window?.leadingAnchor)!).isActive = true
//        statusBarBGView.trailingAnchor.constraint(equalTo: (window?.trailingAnchor)!).isActive = true
//        statusBarBGView.topAnchor.constraint(equalTo: (window?.topAnchor)!).isActive = true
//        statusBarBGView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        self.setStatusBarColor(UIColor.rgb(r: 194, g: 31, b: 31))
        self.setRootView()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate {
    
    func setRootView() {
        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        window?.makeKeyAndVisible()
    }
    
    func setStatusBarColor(_ color: UIColor) {
        guard let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
            return
        }
        statusBarView.backgroundColor = color
    }
}
