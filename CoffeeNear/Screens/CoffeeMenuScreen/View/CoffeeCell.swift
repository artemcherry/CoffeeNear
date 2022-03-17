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
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "7F6445")
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
    
    static let identifier = "CoffeeCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        

    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
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
        
    }
    
    func setupCell(model: CoffeeModel) {
        imageView.image = UIImage(named: model.image ?? "")
    }
    

}
