//
//  CoffeeMenuPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 17.03.2022.
//

import Foundation

protocol CoffeeMenuPresenterProtocol: AnyObject {
    init(view: CoffeeMenuViewProtocol, interactor: CoffeeMenuInteractorProtocol, router: MainRouterProtocol)
    func getCoffeList() -> [CoffeeModel]?
}

class CoffeeMenuPresenter: CoffeeMenuPresenterProtocol {
    
    private let view: CoffeeMenuViewProtocol?
    private let interactor: CoffeeMenuInteractorProtocol?
    private let router: MainRouterProtocol?
    
    required init(view: CoffeeMenuViewProtocol, interactor: CoffeeMenuInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getCoffeList() -> [CoffeeModel]? {
        return interactor?.getCoffeeMenuList()
    }
}
