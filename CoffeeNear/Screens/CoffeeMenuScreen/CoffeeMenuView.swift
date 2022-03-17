//
//  CoffeeMenuView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 17.03.2022.
//

import UIKit

protocol CoffeeMenuViewProtocol: AnyObject {}

class CoffeeMenuView: UIViewController, CoffeeMenuViewProtocol {
    
    var presenter: CoffeeMenuPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
}
