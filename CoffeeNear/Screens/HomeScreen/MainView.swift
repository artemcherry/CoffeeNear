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
        let button = UIButton()
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = UIColor(hex: "332D1C") ?? .black
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.isEnabled  = true
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(hex: "332D1C") ?? .black
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    var presenter: MainPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        loginButton.layer.cornerRadius = loginButton.frame.height / 2

    }
    
    @objc private func registerTapped() {
        presenter?.goToRegister()
    }
    
    @objc private func loginTapped() {
        presenter?.goToLogin()
    }
    
    private func setupView() {
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height/2 - 50),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
 
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
