//
//  LoginRouter.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 13/11/21.
//

import UIKit

protocol LoginRouterLogic : AnyObject {
    func showSignUpPage(navController: UINavigationController?)
    func backToLoginPage(navController: UINavigationController?)
    
}

class LoginRouter : LoginRouterLogic {
    func showSignUpPage(navController: UINavigationController?) {
        navController?.pushViewController(LoginFactory.makeSignupController(), animated: true)
    }
    
    func backToLoginPage(navController: UINavigationController?) {
        navController?.popViewController(animated: true)
    }
}

