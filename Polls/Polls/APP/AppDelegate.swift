//
//  AppDelegate.swift
//  Polls
//
//  Created by Murat Can ASLAN on 28.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        start()
        return true
    }
    
    private func start() {
        let vc = UINavigationController(rootViewController: PollsViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

