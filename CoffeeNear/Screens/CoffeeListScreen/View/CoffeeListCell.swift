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
        view.backgroundColor = UIColor(hex: "7F6445") ?? UIColor.orange
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.cornerRadius = 10
        return view
    }()
    
    static let identifier = "Cell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = contentView.bounds
    }
}
