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
    func goToRegisterScreen()
}

class MainRouter: MainRouterProtocol {
    
    var mainBuilder: BuilderProtocol?
    var navigationController: UINavigationController?
    
    required init(builder: BuilderProtocol) {
        self.mainBuilder = builder
    }
    
    func goToRegisterScreen() {
        guard let registrationScreen = mainBuilder?.createRegistrationScreen(router: self) as? RegistrationView else { return }
        navigationController?.viewControllers = [registrationScreen]
        navigationController?.pushViewController(registrationScreen, animated: true)
    }
}
