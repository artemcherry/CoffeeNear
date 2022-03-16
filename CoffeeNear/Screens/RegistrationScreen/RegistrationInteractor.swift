//
//  RegistrationInteractor.swift
//  CoffeeNear
//
//  Created by Артем Вишняков on 02.03.2022.
//

import Foundation
import FirebaseAuth

protocol RegistrationInteractorProtocol: AnyObject {
    func registerUser(email: String, password: String, completion: @escaping (Error?) -> Void)
}

class RegistrationInteractor: RegistrationInteractorProtocol {
    
    func registerUser(email: String, password: String, completion: @escaping (Error?) -> Void) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
}
