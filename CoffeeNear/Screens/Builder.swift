//
//  Builder.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 04.03.2022.
//

import Foundation
import UIKit

protocol BuilderProtocol: AnyObject {
    func createMainScreen(router: MainRouterProtocol) -> UIViewController?
    func createRegistrationScreen(router: MainRouterProtocol) -> UIViewController?
    func createLoginScreen(router: MainRouterProtocol) -> UIViewController?
}

class Builder: BuilderProtocol {
    
     func createMainScreen(router: MainRouterProtocol) -> UIViewController? {
        let view = MainView()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
     func createRegistrationScreen(router: MainRouterProtocol) -> UIViewController? {
        let view = RegistrationView()
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        return view 
    }
    
    func createLoginScreen(router: MainRouterProtocol) -> UIViewController? {
        let view = LoginView()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: view, router: router, interactor: interactor)
        view.presnter = presenter
        return view
    }
}