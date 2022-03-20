//
//  CoffeeMenuView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 17.03.2022.
//

import UIKit

protocol CoffeeMenuViewProtocol: AnyObject {}

class CoffeeMenuView: UIViewController, CoffeeMenuViewProtocol {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoffeeCell.self, forCellWithReuseIdentifier: CoffeeCell.identifier)
        collectionView.register(CustomFooterWithButton.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: CustomFooterWithButton.identifier)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    var presenter: CoffeeMenuPresenterProtocol?
    private var coffeeMenuList: [CoffeeModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        title = "Ближайшие кофейни"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        coffeeMenuList = presenter?.getCoffeList()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension CoffeeMenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coffeeMenuList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard  let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: CoffeeCell.identifier, for: indexPath) as? CoffeeCell,
        let coffeeMenu = coffeeMenuList
        else { return UICollectionViewCell() }
        
        cell.setupCell(model: coffeeMenu[indexPath.row])
        
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterWithButton.identifier, for: indexPath) as? CustomFooterWithButton else { return UICollectionReusableView() }
        footer.configure()
        footer.chartButton.addTarget(self, action: #selector(goToChartTapped), for: .touchUpInside)
        return footer
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let width: CGFloat = UIScreen.main.bounds.width / itemsPerRow - 25
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 150)
    }
    
    @objc private func goToChartTapped() {
        presenter?.goToChartScreen(coffeeList: coffeeMenuList!)
    }
}
