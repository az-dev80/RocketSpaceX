//
//  AppDelegate.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 13.09.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13, *) {
        } else {
            let tbVC = TabBarViewController()
            UITabBar.appearance().barTintColor = UIColor(named: "Queen Blue")
            //UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().tintColor = UIColor(red: 1, green: 0.522, blue: 0.322, alpha: 1)
            UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.957, green: 0.914, blue: 0.804, alpha: 1)
            
            let rocketsVC = RocketsViewController()
            let launchesVC = LaunchesViewController()
            let launchpadsVC = LaunchpadsViewController()
            
            let navVC = NavigationControllerFirst()
            navVC.viewControllers = [rocketsVC]
            
            let navVC2 = NavigationControllerSecond()
            navVC2.viewControllers = [launchesVC]
            
            let navVC3 = NavigationControllerThird()
            navVC3.viewControllers = [launchpadsVC]
            
            tbVC.viewControllers = [navVC, navVC2, navVC3]
            
            let topInset = CGFloat(-35)
            
            navVC.tabBarItem.title = "Rockets"
            navVC.tabBarItem.image = UIImage(named: "rocket")
            navVC.tabBarItem.imageInsets = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
            navVC.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: topInset)
            
            navVC2.tabBarItem.title = "Launches"
            navVC2.tabBarItem.image = UIImage(named: "adjustment")
            navVC2.tabBarItem.imageInsets = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
            navVC2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: topInset)
            
            navVC3.tabBarItem.title = "Launchpads"
            navVC3.tabBarItem.image = UIImage(named: "lego")
            navVC3.tabBarItem.imageInsets = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
            navVC3.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: topInset)
            
            if let items = tbVC.tabBar.items {
                for item in items {
                    item.setTitleTextAttributes([.font: UIFont(name: "Roboto-Medium", size: 10)!], for: .selected)
                    item.setTitleTextAttributes([.font: UIFont(name: "Roboto-Medium", size: 10)!], for: .normal)
                }
            }
            
            UINavigationBar.appearance().tintColor = UIColor.red
            UINavigationBar.appearance().barTintColor = UIColor(named: "Queen Blue")
            UINavigationBar.appearance().isTranslucent = false
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = tbVC
            window?.makeKeyAndVisible()
        }
        return true
    }

     //MARK: UISceneSession Lifecycle
    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

