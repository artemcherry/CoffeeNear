//
//  MainView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 04.03.2022.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    
}

class MainView: UIViewController, MainViewProtocol {
    
    private let signUpButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 350, width: 330, height: 50))
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = UIColor(hex: "332D1C") ?? .black
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.isEnabled  = true
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    } ()
    
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 450, width: 330, height: 50))
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(hex: "332D1C") ?? .black
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    } ()
    
    var presenter: MainPresenterProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(signUpButton)
        view.addSubview(loginButton)
    
    }
    
    @objc private func registerTapped() {
        presenter?.goToRegister()
    }
    
    @objc private func loginTapped() {
        presenter?.goToLogin()
    }
}
