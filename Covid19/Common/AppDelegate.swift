//
//  AppDelegate.swift
//  Covid19
//
//  Created by Dağhan Kılıçay on 22.10.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        window = UIWindow.init(frame: screen())
        window?.rootViewController = sb.instantiateInitialViewController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        LocalizationSystem.sharedInstance.deleteLanguage()
    }
}

