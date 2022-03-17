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
        
        let appereance = UINavigationBarAppearance()
        appereance.titleTextAttributes = [NSAttributedString.Key
                                            .font:  UIFont(name: "Avenir Next Demi Bold", size: 18) ?? UIFont(),
                                          NSAttributedString.Key.foregroundColor: UIColor(hex: "7F6445") ?? UIColor.orange]
        UINavigationBar.appearance().standardAppearance = appereance
        UINavigationBar.appearance().compactAppearance = appereance
        UINavigationBar.appearance().tintColor = UIColor(hex: "7F6445") ?? UIColor.orange
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainScreenBuilder = Builder()
        let router = MainRouter(builder: mainScreenBuilder)
//        let mainVC = mainScreenBuilder.createCoffeeListScreen(router: router)
        let mainVC = UINavigationController(rootViewController: mainScreenBuilder.createMainScreen(router:router) ?? UIViewController())
        window.rootViewController = mainVC
        router.navigationController = mainVC
        window.makeKeyAndVisible()
        self.window = window
        FirebaseApp.configure()
        return true
    }
}

