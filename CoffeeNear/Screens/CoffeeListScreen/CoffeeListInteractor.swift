//
//  CoffeeListInteractor.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import Foundation

protocol CoffeeListInteractorProtocol: AnyObject {
    func getCoffeeList() -> [String]
}

class CoffeeListInteractor: CoffeeListInteractorProtocol {
    
    private let coffeeList = ["BEDOEV COFFEE",
                              "Coffee like",
                              "EM&DI Coffee and Snacks",
                              "Коффе Есть",
                              "BEDOEV COFFEE 2"]
    
    func getCoffeeList() -> [String] {
        return coffeeList
    }
    
}
