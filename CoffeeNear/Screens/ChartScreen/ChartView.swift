//
//  ChartView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 20.03.2022.
//

import UIKit

protocol ChartViewProtocol: AnyObject {
    
}

class ChartView: UIViewController, ChartViewProtocol {
    
    var presenter: ChartPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Ваш заказ"
    }
}
