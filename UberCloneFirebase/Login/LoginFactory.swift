//
//  LoginFactory.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation
import UIKit

protocol LoginJourney : AnyObject {
    func didFinishLoginJourney()
}

protocol LoginBusinessLogic {
    func didTryLogin(request: LoginModel)
    func didTrySignup(request: SignupModel)
}

protocol LoginRepositoryLogic {
    func createUser(request: SignupModel, completion: @escaping (Result<Bool, Error>) -> Void)
    func login(request: LoginModel, completion: @escaping(Result<Bool, Error>) -> Void)
}

protocol LoginDisplayLogic : AnyObject {
    func presentAlert()
    func presentCustomAlert(message: String)
    func goToMain()
}

protocol LoginPresentationLogic {
    var viewController: LoginDisplayLogic? { get }
    func presentError()
    func presentCustomError(message: String)
    func presentMain()
}


class LoginFactory {
    static func makeLoginController(delegate: LoginJourney?) -> UIViewController{
        let loginVC = LoginViewController()
        let router = LoginRouter()
        router.delegate = delegate
        let presenter = LoginPresentation()
        let worker = LoginWorker()
        let interactor = LoginInteractor(worker: worker, presentation: presenter)
        loginVC.router = router
        loginVC.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = loginVC
        interactor.worker = worker
        return loginVC
    }
    
    static func makeSignupController() -> UIViewController {
        let signupVC = SignupViewController()
        let router = LoginRouter()
        let presenter = LoginPresentation()
        let worker = LoginWorker()
        let interactor = LoginInteractor(worker: worker, presentation: presenter)
        
        signupVC.router = router
        signupVC.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = signupVC
        return signupVC
    }
}
