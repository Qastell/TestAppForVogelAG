//
//  AppDelegate.swift
//  TestAppForVogelAG
//
//  Created by Кирилл Романенко on 10.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: SearchModuleAssembly.create())
        window?.makeKeyAndVisible()
        
        return true
    }


}

