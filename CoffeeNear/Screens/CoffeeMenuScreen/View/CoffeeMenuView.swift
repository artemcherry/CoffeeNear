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
//        layout.itemSize = CGSize(width: 175, height: 165)
//        layout.estimatedItemSize  = CGSize(width: 175, height: 165)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .systemPink
        return collectionView
    }()
    
    var presenter: CoffeeMenuPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension CoffeeMenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .cyan
        return cell
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let width: CGFloat = UIScreen.main.bounds.width / itemsPerRow - 25
        return CGSize(width: width, height: width)
    }
}
