//
//  AppDelegate.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared: AppDelegate {
             return UIApplication.shared.delegate as! AppDelegate
        }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainScreenBuilder = Builder()
        let router = MainRouter(builder: mainScreenBuilder)
        window.rootViewController = mainScreenBuilder.createMainScreen(router: router)
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

