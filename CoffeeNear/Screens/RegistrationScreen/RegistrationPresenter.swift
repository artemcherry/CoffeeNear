//
//  RegistrationPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import Foundation

protocol RegistrationPresnterProtocol: AnyObject {
    func registerUser(email: String, password: String)
}

class RegistrationPresenter: RegistrationPresnterProtocol {
    
    private let view: RegistrationViewProtocol
    private let router: MainRouterProtocol
    private let interactor: RegistrationInteractorProtocol
    
    init(view: RegistrationViewProtocol, router: MainRouterProtocol, interactor: RegistrationInteractorProtocol ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func registerUser(email: String, password: String) {
        interactor.registerUser(email: email, password: password) { [weak self] error in
            guard let self = self else { return }
            if error != nil {
                self.view.showAlert()
            } else {
                self.router.goToCoffeeListScreen()
            }
        }
    }
}
