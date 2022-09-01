//
//  SceneDelegate.swift
//  rs-ios-stage-task11
//
//  Created by Albert Zhloba on 13.09.21.


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
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
       
        let topInset = CGFloat(0)
        
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
        
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = tbVC
        window?.makeKeyAndVisible()
        
        
    }
    @available(iOS 13, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    @available(iOS 13, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    @available(iOS 13, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    @available(iOS 13, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    @available(iOS 13, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

