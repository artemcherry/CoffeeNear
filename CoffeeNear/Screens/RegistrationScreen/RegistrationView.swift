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
        let label = UILabel(frame: CGRect(x: 30, y: 320, width: 100, height: 30))
        label.text = "e-mail"
        label.textColor = UIColor(hex: "7F6445")
        return label
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 350, width: 330, height: 50))
        textField.attributedPlaceholder = NSAttributedString(
            string: "example@example.ru",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A9937B") ?? .black])
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor(hex: "7F6445")?.cgColor
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = textField.frame.height / 2
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        return textField
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 420, width: 100, height: 30))
        label.text = "Пароль"
        label.textColor = UIColor(hex: "7F6445")
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 450, width: 330, height: 50))
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
        return textField
    }()
    
    private let repeatPasswordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 520, width: 200, height: 30))
        label.text = "Повторите пароль"
        label.textColor = UIColor(hex: "7F6445")
        return label
    }()
    
    private let repeatPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 550, width: 330, height: 50))
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "********",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hex: "A9937B") ?? .black])
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor(hex: "7F6445")?.cgColor
        textField.layer.cornerRadius = textField.frame.height / 2
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        return textField
    }()
    
    private let registerButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 620, width: 330, height: 50))
        button.backgroundColor = UIColor(hex: "332D1C")
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(UIColor(hex: "F3E5D3"), for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    var presenter: RegistrationPresnterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Регистрация"
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordLabel)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(registerButton)
    }

    @objc private func registerButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter?.registerUser(email: email, password: password)
    }
    
    private func registerButtonView() {
        
        if passwordTextField.text == "",
           emailTextField.text == "",
           repeatPasswordTextField.text == "" {
            registerButton.backgroundColor = .systemGray
            registerButton.isEnabled = false
        } else {
            registerButton.backgroundColor =  UIColor(hex: "332D1C")
            registerButton.isEnabled = true
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Email или пароль неверен. Повторите попытку ", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
