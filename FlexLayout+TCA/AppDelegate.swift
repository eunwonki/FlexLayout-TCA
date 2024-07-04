//
//  AppDelegate.swift
//  FlexLayout+TCA
//
//  Created by liam on 7/2/24.
//

import UIKit

import ComposableArchitecture

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationController = UINavigationController()
        navigationController.viewControllers = [MainViewController(navigationController: navigationController)]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

