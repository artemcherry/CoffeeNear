//
//  RegistrationView.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    func showAlert()
}

class RegistrationView: UIViewController, RegistrationViewProtocol {
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "e-mail"
        label.textColor = UIColor(hex: "7F6445")
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "example@example.ru",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A9937B") ?? .black])
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor(hex: "7F6445")?.cgColor
        textField.autocapitalizationType = .none
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пароль"
        label.textColor = UIColor(hex: "7F6445")
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
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let repeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Повторите пароль"
        label.textColor = UIColor(hex: "7F6445")
        return label
    }()
    
    private let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "********",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A9937B") ?? .black])
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor(hex: "7F6445")?.cgColor
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let registerButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    var presenter: RegistrationPresnterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Регистрация"
        
        setupView()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailLabel.layer.cornerRadius = emailLabel.frame.height / 2
        emailTextField.layer.cornerRadius = emailTextField.frame.height / 2
        passwordLabel.layer.cornerRadius = passwordLabel.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.height / 2
        repeatPasswordLabel.layer.cornerRadius = repeatPasswordLabel.frame.height / 2
        repeatPasswordTextField.layer.cornerRadius = repeatPasswordTextField.frame.height / 2
        registerButton.layer.cornerRadius = registerButton.frame.height / 2
    }

    @objc private func registerButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter?.registerUser(email: email, password: password)
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
        
        view.addSubview(repeatPasswordLabel)
        
        NSLayoutConstraint.activate([
            repeatPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            repeatPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            repeatPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repeatPasswordLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        view.addSubview(repeatPasswordTextField)
        
        NSLayoutConstraint.activate([
            repeatPasswordTextField.topAnchor.constraint(equalTo: repeatPasswordLabel.bottomAnchor, constant: 20),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 25),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension RegistrationView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty ||  repeatPasswordTextField.text!.isEmpty {
            registerButton.isEnabled = false
        } else {
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor(hex: "332D1C")
        }
    }
}
