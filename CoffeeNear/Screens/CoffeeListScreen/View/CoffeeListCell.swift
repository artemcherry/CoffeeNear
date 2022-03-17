//
//  CoffeeListCell.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import UIKit

class CoffeeListCell: UITableViewCell {
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "FAE1D3") ?? UIColor.orange
        view.layer.shadowOpacity = 10
        view.layer.shadowOffset = CGSize(width: 3, height: 2)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(hex: "7F6445")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let identifier = "CoffeeListCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(name: String) {
        nameLabel.text = name
    }
    
    private func setupContstraints() {
        contentView.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        
    }
}
