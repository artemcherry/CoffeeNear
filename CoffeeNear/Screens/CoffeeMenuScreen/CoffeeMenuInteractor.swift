//
//  CoffeeMenuInteractor.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 17.03.2022.
//

import Foundation

protocol CoffeeMenuInteractorProtocol: AnyObject {
    func getCoffeeMenuList() -> [CoffeeModel]?
}

class CoffeeMenuInteractor: CoffeeMenuInteractorProtocol {
    
    let coffeeMenuList = [
        CoffeeModel(coffeeName: "Эспрессо", price: 200, image: "espresso"),
        CoffeeModel(coffeeName: "Капучино", price: 200, image: "capuccino"),
        CoffeeModel(coffeeName: "Горячий шоколад", price: 200, image: "hotChocolate"),
        CoffeeModel(coffeeName: "Латте", price: 200, image: "latte"),
        CoffeeModel(coffeeName: "Горячий шоколад", price: 200, image: "hotChocolate"),
        CoffeeModel(coffeeName: "Латте", price: 200, image: "latte")
    ]
    
    func getCoffeeMenuList() -> [CoffeeModel]? {
        return coffeeMenuList
    }
}
