//
//  CoffeeCell.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 17.03.2022.
//

import UIKit

class CoffeeCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "7F6445")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "7F6445")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "7F6445")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
