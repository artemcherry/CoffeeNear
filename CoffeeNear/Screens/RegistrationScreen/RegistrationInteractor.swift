//
//  RegistrationInteractor.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import Foundation
import FirebaseAuth

protocol RegistrationInteractorProtocol: AnyObject {
    func registerUser(email: String, password: String)
}

class RegistrationInteractor: RegistrationInteractorProtocol {
    
    func registerUser(email: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { _, _ in
        }
    }
    
}
