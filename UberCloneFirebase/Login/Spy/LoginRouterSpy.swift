//
//  LoginRouterSpy.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 13/11/21.
//

import UIKit

class LoginRouterSpy : LoginRouterLogic {
    func showSignUpPage(navController: UINavigationController?) {
        signupPageCalled = true
    }
    
    var signupPageCalled = false
    
}
