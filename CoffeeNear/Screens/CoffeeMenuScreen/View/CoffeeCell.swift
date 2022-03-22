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
        imageView.contentMode = .scaleToFill
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
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor(hex: "AB957C")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = UIColor(hex: "7F6445")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "7F6445")
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        button.titleLabel!.font = .systemFont(ofSize: 30, weight: .bold)
        button.setTitle("-", for: .normal)
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.titleLabel!.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitle("+", for: .normal)
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let identifier = "CoffeeCell"
    private var numberOfCoffee = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 10
        
        numberOfCoffee = 0
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: (contentView.bounds.height / 3) * 2)
        ])
        
        contentView.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: contentView.bounds.height / 3)
        ])
        
        bottomView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        bottomView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -80),
            priceLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        bottomView.addSubview(minusButton)
        
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            minusButton.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 25),
            minusButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -50),
            minusButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        bottomView.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.topAnchor.constraint(equalTo:  nameLabel.bottomAnchor, constant: 5),
            numberLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 5),
            numberLabel.widthAnchor.constraint(equalToConstant: 20),
            numberLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        bottomView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo:  nameLabel.bottomAnchor, constant: 5),
            addButton.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 5),
            addButton.widthAnchor.constraint(equalToConstant: 20),
            addButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    func setupCell(model: CoffeeModel) {
        guard let price = model.price,
              let numberOfCups = model.numberOfCups 
        else { return }
        imageView.image = UIImage(named: model.image ?? "")
        nameLabel.text = model.coffeeName
        priceLabel.text = "\(price) руб"
        numberLabel.text = "\(numberOfCups)"
    }

    @objc private func addButtonTapped() {
        numberOfCoffee += 1
        numberLabel.text = "\(numberOfCoffee)"
    }
    
    @objc private func minusButtonTapped() {
        numberOfCoffee -= 1
        numberLabel.text = "\(numberOfCoffee)"
    }

}
