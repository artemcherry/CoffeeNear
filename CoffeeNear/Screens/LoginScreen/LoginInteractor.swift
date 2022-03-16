//
//  LoginInteractor.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 16.03.2022.
//

import Foundation
import FirebaseAuth

protocol LoginInteractorProtocol: AnyObject {
    func login(email: String, password: String, competion: @escaping (Error?) -> Void)
}

class LoginInteractor: LoginInteractorProtocol {
    func login(email: String, password: String, competion: @escaping (Error?) -> Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                competion(error)
            } else {
                print("success")
                competion(nil)
            }
        }
    }
}


