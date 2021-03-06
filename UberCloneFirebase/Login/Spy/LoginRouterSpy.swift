//
//  LoginRouterSpy.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 13/11/21.
//

import UIKit

class LoginRouterSpy : LoginRouterLogic {
    func goToMainMenu(navController: UINavigationController?) {
        goToMainCalled = true
    }
    
    func backToLoginPage(navController: UINavigationController?) {
        loginPageCalled = true
    }
    
    func showSignUpPage(navController: UINavigationController?) {
        signupPageCalled = true
    }
    
    var signupPageCalled = false
    var loginPageCalled = false
    var goToMainCalled = false
    
}
