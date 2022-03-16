//
//  MainPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 04.03.2022.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, router: MainRouterProtocol)
    func goToRegister()
    func goToLogin()
}

class MainPresenter: MainPresenterProtocol {

    private let view: MainViewProtocol?
    private let router: MainRouterProtocol?
    
    required init(view: MainViewProtocol, router: MainRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func goToRegister() {
        router?.goToRegistrationScreen()
    }
    
    func goToLogin() {
        router?.goToLoginScreen()
    }
    
}
