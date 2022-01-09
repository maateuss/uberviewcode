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
    func goToMainMenu(navController: UINavigationController?)
}

class LoginRouter : LoginRouterLogic {
    
    weak var delegate: LoginJourney?
    
    func goToMainMenu(navController: UINavigationController?) {
        navController?.popToRootViewController(animated: true)
        delegate?.didFinishLoginJourney()
    }
    
    func showSignUpPage(navController: UINavigationController?) {
        navController?.pushViewController(LoginFactory.makeSignupController(), animated: true)
    }
    
    func backToLoginPage(navController: UINavigationController?) {
        navController?.popViewController(animated: true)
    }
    
    
    
}

