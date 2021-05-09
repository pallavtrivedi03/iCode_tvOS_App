//
//  AppDelegate.swift
//  tvOS_First_Test
//
//  Created by Pallav Trivedi on 01/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        homeVC.tabBarItem.title = "Home"
        
        let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController")
        searchVC.tabBarItem.title = "Search"
        
        let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfileViewController")
        profileVC.tabBarItem.title = "Profile"
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeVC, searchVC, profileVC]
        self.window?.rootViewController = tabbarController
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

