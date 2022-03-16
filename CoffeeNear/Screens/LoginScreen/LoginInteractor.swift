//
//  LoginInteractor.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import Foundation
import FirebaseAuth

protocol LoginInteractorProtocol: AnyObject {
    func login(email: String, password: String)
}

class LoginInteractor: LoginInteractorProtocol {
    
    func login(email: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("success")
            }
        }
    }
}
