//
//  LoginInteractor.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation

class LoginInteractor : LoginBusinessLogic {
    
    
    var worker: LoginRepositoryLogic
    var presenter: LoginPresentationLogic
    
    init(worker: LoginRepositoryLogic, presentation: LoginPresentationLogic){
        self.worker = worker
        self.presenter = presentation
    }
    
    func didTryLogin(request: LoginModel) {
        self.worker.login(request: request) { result  in
            switch result {
            case let .success(loginAttempt):
                if loginAttempt {
                    // go to main
                } else {
                    self.presenter.presentCustomError(message: "Usuario ou senha invalidos")
                }
            case let .failure(err):
                print(err.localizedDescription)
                self.presenter.presentError()
            }
        }
        
    }
    
    func didTrySignup(request: SignupModel) {
        self.worker.createUser(request: request) { result in
            switch result {
            case let .success(created):
                if created {
                    // go to main?
                } else {
                    self.presenter.presentCustomError(message: "Não foi possível criar um usuário com esses valores")
                }
            case let .failure(err):
                print(err.localizedDescription)
                self.presenter.presentError()
            }
        }
    }
}
