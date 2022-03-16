//
//  Router.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 04.03.2022.
//

import Foundation
import UIKit

protocol MainRouterProtocol: AnyObject {
    var mainBuilder: BuilderProtocol? { get set }
    init(builder: BuilderProtocol)
    func goToRegistrationScreen()
    func goToLoginScreen()
}

class MainRouter: MainRouterProtocol {
    
    var mainBuilder: BuilderProtocol?
    var navigationController: UINavigationController?
    
    required init(builder: BuilderProtocol) {
        self.mainBuilder = builder
    }
    
    func goToRegistrationScreen() {
        guard let registrationScreen = mainBuilder?.createRegistrationScreen(router: self) else { return }
        navigationController?.pushViewController(registrationScreen, animated: true)
    }
    
    func goToLoginScreen() {
        guard let loginScreen = mainBuilder?.createLoginScreen(router: self) else { return }
        navigationController?.pushViewController(loginScreen, animated: true)
    }
}
