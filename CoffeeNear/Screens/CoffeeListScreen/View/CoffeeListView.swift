//
//  CoffeeListView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import UIKit

protocol CoffeeListViewProtocol: AnyObject {}

class CoffeeListView: UIViewController, CoffeeListViewProtocol {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(CoffeeListCell.self, forCellReuseIdentifier: CoffeeListCell.identifier)
        return table
    }()
    
    var presenter: CoffeeListPresenterProtocol?
    private var coffeeList: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Ближайшие кофейни"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", image: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        coffeeList = presenter?.getCoffeeList()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension CoffeeListView: UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoffeeListCell.identifier, for: indexPath) as? CoffeeListCell else { return UITableViewCell() }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
}
