//
//  LoginFactory.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation
import UIKit

class LoginFactory {
    static func makeLoginController(router:LoginRouter = LoginRouter()) -> UIViewController{
        let loginVC = LoginViewController()
        loginVC.router = router
        return loginVC
    }
}
