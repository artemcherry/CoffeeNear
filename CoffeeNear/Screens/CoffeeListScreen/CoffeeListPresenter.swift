//
//  CoffeeListPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import Foundation

protocol CoffeeListPresenterProtocol: AnyObject {
    init(view: CoffeeListViewProtocol, router: MainRouterProtocol, interactor: CoffeeListInteractorProtocol)
    func getCoffeeList() -> [String]?
    func goToCoffeMenu()
}

class CoffeeListPresenter: CoffeeListPresenterProtocol {
    
    private let view: CoffeeListViewProtocol?
    private let router: MainRouterProtocol?
    private let interactor: CoffeeListInteractorProtocol?
    
    required init(view: CoffeeListViewProtocol, router: MainRouterProtocol, interactor: CoffeeListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getCoffeeList() -> [String]? {
        return interactor?.getCoffeeList()
    }
    
    func goToCoffeMenu() {
        router?.goToCoffeeMenuScreen()
    }
}
