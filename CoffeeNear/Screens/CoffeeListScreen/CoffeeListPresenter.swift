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
}

class CoffeeListPresenter: CoffeeListPresenterProtocol {
    
    private let view: CoffeeListViewProtocol?
    private let router: MainRouterProtocol?
    private let interactor: CoffeeListInteractorProtocol?
//    var coffeeList: [String]
    
    required init(view: CoffeeListViewProtocol, router: MainRouterProtocol, interactor: CoffeeListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getCoffeeList() -> [String]? {
        return interactor?.getCoffeeList()
    }
}
