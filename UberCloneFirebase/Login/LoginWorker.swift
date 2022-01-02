//
//  LoginWorker.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation

class LoginWorker : LoginRepositoryLogic {
    func createUser(request: SignupModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        if true {
            completion(.success(true))
        } else{
            completion(.failure(LoginError.NetworkError))
        }
    }
    
    func login(request: LoginModel, completion: @escaping (Result<Bool, Error>) -> Void) {
        if true {
            completion(.success(true))
        } else{
            completion(.failure(LoginError.NetworkError))
        }
    }
    
    
}
