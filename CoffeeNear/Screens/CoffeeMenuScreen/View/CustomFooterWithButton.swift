//
//  CustomFooterWithButton.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 20.03.2022.
//

import UIKit

class CustomFooterWithButton: UICollectionReusableView {
    
    static let identifier = "CustomFooterWithButton"
    
    let chartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "332D1C")
        button.setTitle("Перейти к оплате", for: .normal)
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configure() {
        setupView()
        backgroundColor = .systemBackground
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chartButton.layer.cornerRadius = chartButton.frame.height / 2
    }
    
    private func setupView() {
        addSubview(chartButton)
        
        NSLayoutConstraint.activate([
            chartButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            chartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            chartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            chartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}
