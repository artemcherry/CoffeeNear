//
//  CoffeeListPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import Foundation

protocol CoffeeListPresenterProtocol: AnyObject {
    init(view: CoffeeListViewProtocol, router: MainRouterProtocol)
}

class CoffeeListPresenter: CoffeeListPresenterProtocol {
    
    private let view: CoffeeListViewProtocol?
    private let router: MainRouterProtocol?
    
    required init(view: CoffeeListViewProtocol, router: MainRouterProtocol) {
        self.view = view
        self.router = router
    }
    
}
