//
//  ChartPresenter.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 20.03.2022.
//

import Foundation

protocol ChartPresenterProtocol: AnyObject {
    init(view: ChartViewProtocol, interactor: ChartInteractorProtocol, router: MainRouterProtocol)
}

class ChartPresenter: ChartPresenterProtocol {
    
    private let view: ChartViewProtocol
    private let interactor: ChartInteractorProtocol
    private let router: MainRouterProtocol
    
    required init(view: ChartViewProtocol, interactor: ChartInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
