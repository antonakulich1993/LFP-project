//
//  AppDelegate.swift
//  LFP-project
//
//  Created by MacBook on 13.12.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
        window?.makeKeyAndVisible()
        subcribeNotification()
        return true
    }
    
    func subcribeNotification() {
        func subscribeNotification() {
            NotificationCenter.default.addObserver(self, selector: #selector(changeMainScreen),
                                                   name: Notification.Name.loginDidSuccess,
                                                   object: nil)
        }
    }
    @objc func changeMainScreen() {
        window?.rootViewController = TabBarControllers(nibName: String(describing: TabBarControllers.self), bundle: nil)
        window?.makeKeyAndVisible()
    }
}
