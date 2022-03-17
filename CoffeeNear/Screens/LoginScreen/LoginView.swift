//
//  LoginView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func showAlert()
}

class LoginView: UIViewController, LoginViewProtocol {
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "e-mail"
        label.textColor = UIColor(hex: "7F6445")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "example@example.ru",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A9937B") ?? .black])
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor(hex: "7F6445")?.cgColor
        textField.layer.cornerRadius = textField.frame.height / 2
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.text = "123@321.ru"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.textColor = UIColor(hex: "7F6445")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "********",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A9937B") ?? .black])
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor(hex: "7F6445")?.cgColor
        textField.layer.cornerRadius = textField.frame.height / 2
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.text = "Aartem553"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presnter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Войти"
        
        setupView()
       
        emailTextField.delegate = self
        passwordTextField.delegate = self

        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailLabel.layer.cornerRadius = emailLabel.frame.height / 2
        emailTextField.layer.cornerRadius = emailTextField.frame.height / 2
        passwordLabel.layer.cornerRadius = passwordLabel.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }

    
    @objc private func loginButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presnter?.login(email: email, password: password)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Email или пароль неверен. Повторите попытку ", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupView() {

        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height/3 - 50),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(passwordLabel)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            loginButton.isEnabled = false
        } else {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor(hex: "332D1C")            
        }
    }
}
