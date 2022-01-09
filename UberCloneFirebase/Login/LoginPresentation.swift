//
//  LoginPresentation.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 09/01/22.
//

import Foundation

final class LoginPresentation : LoginPresentationLogic {

    
    
    weak var viewController: LoginDisplayLogic?
    
    
    func presentError() {
        self.viewController?.presentAlert()
    }
    
    func presentCustomError(message: String) {
        self.viewController?.presentCustomAlert(message: message)
    }
    
    func presentMain() {
        self.viewController?.goToMain()
    }
    
}
