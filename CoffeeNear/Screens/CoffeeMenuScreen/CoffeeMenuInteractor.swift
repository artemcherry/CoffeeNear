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
        CoffeeModel(coffeeName: "Эспрессо", price: 200, image: "espresso", numberOfCups: 0),
        CoffeeModel(coffeeName: "Капучино", price: 200, image: "capuccino", numberOfCups: 0),
        CoffeeModel(coffeeName: "Горячий шоколад", price: 200, image: "hotChocolate", numberOfCups: 0),
        CoffeeModel(coffeeName: "Латте", price: 200, image: "latte", numberOfCups: 0),
        CoffeeModel(coffeeName: "Горячий шоколад", price: 200, image: "hotChocolate", numberOfCups: 0),
        CoffeeModel(coffeeName: "Латте", price: 200, image: "latte", numberOfCups: 0)
    ]
    
    func getCoffeeMenuList() -> [CoffeeModel]? {
        return coffeeMenuList
    }
}
