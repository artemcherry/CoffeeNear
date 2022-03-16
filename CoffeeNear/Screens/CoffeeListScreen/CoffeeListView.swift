//
//  CoffeeListView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import UIKit

protocol CoffeeListViewProtocol: AnyObject {}

class CoffeeListView: UIViewController, CoffeeListViewProtocol {
    
    var presenter: CoffeeListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink

    }
}
