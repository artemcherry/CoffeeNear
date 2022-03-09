//
//  RegistrationPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import Foundation

protocol RegistrationPresnterProtocol: AnyObject {
    
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
}
