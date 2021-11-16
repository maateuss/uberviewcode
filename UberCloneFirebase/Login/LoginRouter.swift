//
//  LoginRouter.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 13/11/21.
//

import UIKit

protocol LoginRouterLogic : AnyObject {
    func showSignUpPage(navController: UINavigationController?)
    
}

class LoginRouter : LoginRouterLogic {
    func showSignUpPage(navController: UINavigationController?) {
        print("open signup here")
    }
}

