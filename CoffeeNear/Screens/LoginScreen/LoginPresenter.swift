//
//  LoginPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    init(view: LoginViewProtocol, router: MainRouterProtocol, interactor: LoginInteractorProtocol)
    func login(email: String, password: String)
}

class LoginPresenter: LoginPresenterProtocol {
    
    private let view: LoginViewProtocol?
    private let router: MainRouterProtocol?
    private let interactor: LoginInteractorProtocol?
    
    required init(view: LoginViewProtocol, router: MainRouterProtocol, interactor: LoginInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func login(email: String, password: String) {
        interactor?.login(email: email, password: password, competion: {[weak self] error in
            guard let self = self else { return }
            if error != nil {
                self.view?.showAlert()
            } else {
                self.router?.goToCoffeeListScreen()
            }
        })
    }
}
