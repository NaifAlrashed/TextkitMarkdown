//
//  AppDelegate.swift
//  TextkitMarkdown
//
//  Created by NaifAlrashed on 05/18/2019.
//  Copyright (c) 2019 NaifAlrashed. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let viewController = ViewController()
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = viewController
        return true
    }
}
