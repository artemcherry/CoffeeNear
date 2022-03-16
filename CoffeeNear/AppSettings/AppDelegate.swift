//
//  AppDelegate.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainScreenBuilder = Builder()
        let router = MainRouter(builder: mainScreenBuilder)
        let mainVC = UINavigationController(rootViewController: mainScreenBuilder.createMainScreen(router:router) ?? UIViewController())
        window.rootViewController = mainVC
        router.navigationController = mainVC
        window.makeKeyAndVisible()
        self.window = window
        FirebaseApp.configure()
        return true
    }
}

