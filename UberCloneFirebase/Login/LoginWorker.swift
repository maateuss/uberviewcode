//
//  LoginWorker.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation
import Firebase
import AVFoundation


class LoginWorker : LoginRepositoryLogic {
    
    
    func createUser(request: SignupModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: request.email, password: request.password) { result, error in
            guard let result = result else {
                completion(.failure(LoginError.NetworkError))
                return
            }
            
            
            let userModel = UserModel(name: request.name, email: request.email, type: request.type, uid: result.user.uid)
            
            var dict : [String: Any] = [:]
            
            dict["name"] = userModel.name
            dict["email"] = userModel.email
            dict["type"] = userModel.type.asString()
            dict["uid"] = userModel.uid
            
            Database.database().reference().child("users").child(userModel.uid).updateChildValues(dict) { err, ref in
                completion(.success(true))
            }
        }
    }
    
    func login(request: LoginModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: request.email, password: request.password) {
            result, error in
            guard let result = result else {
                completion(.failure(LoginError.NetworkError))
                return
            }
            
            print("User \(result.user.uid) authenticated!")
            completion(.success(true))
            
        }
        
        
    }
    
    
}
