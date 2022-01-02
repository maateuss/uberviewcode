//
//  LoginInteractor.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation

class LoginInteractor : LoginBusinessLogic {
    
    
    private let worker: LoginRepositoryLogic
    private let presentation: LoginDisplayLogic
    
    
    init(worker: LoginRepositoryLogic, presentation: LoginDisplayLogic){
        self.worker = worker
        self.presentation = presentation
    }
    
    func didTryLogin(request: LoginModel) {
        print("Debug: Handle login in Interactor")
        
    }
    
    func didTrySignup(request: SignupModel) {
        print("Debug: Handle Signup in Interactor")
    }
}
