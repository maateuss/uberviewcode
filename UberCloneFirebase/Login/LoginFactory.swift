//
//  LoginFactory.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation
import UIKit


protocol LoginBusinessLogic {
    func didTryLogin(request: LoginModel)
    func didTrySignup(request: SignupModel)
}

protocol LoginRepositoryLogic {
    func createUser(request: SignupModel, completion: @escaping (Result<Bool, Error>) -> Void)
    func login(request: LoginModel, completion: @escaping(Result<Bool, Error>) -> Void)
}

protocol LoginDisplayLogic{
    func presentAlert()
    func goToMain()
}

class LoginFactory {
    static func makeLoginController() -> UIViewController{
        let loginVC = LoginViewController()
        let router = LoginRouter()
        loginVC.router = router
        return loginVC
    }
    
    static func makeSignupController() -> UIViewController {
        let signupVC = SignupViewController()
        let router = LoginRouter()
        signupVC.router = router
        return signupVC
    }
}
