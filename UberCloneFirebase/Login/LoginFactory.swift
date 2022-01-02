//
//  LoginFactory.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation
import UIKit

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
