//
//  AppDelegate.swift
//  TestTask
//
//  Created by Sasha Riabchuk on 30.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //Setup app coordinator start point.
        let navigationController = UINavigationController.init()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        
        //Push start point.
        appCoordinator?.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

