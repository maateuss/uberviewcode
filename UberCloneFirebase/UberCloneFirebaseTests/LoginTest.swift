//
//  LoginTest.swift
//  UberCloneFirebaseTests
//
//  Created by Mateus Santos on 09/11/21.
//

import Quick
import Nimble
@testable import UberCloneFirebase

class LoginTest: QuickSpec {
    var routerSpy: LoginRouterSpy?
    var loginViewController: LoginViewController?
    var signupViewController: SignupViewController?
    var navigationController: UINavigationController?
    
    override func spec(){
        describe("LoginViewController"){
            context("When clicking signup, navigation to signup page is raised"){
                beforeEach {
                    self.routerSpy = LoginRouterSpy()
                    self.loginViewController = LoginViewController()
                    self.loginViewController?.router = self.routerSpy
                }
                it("raise signup on router"){
                    self.loginViewController?.handleSignUpPressed()
                    expect(self.routerSpy?.signupPageCalled == true)
                }
            
                
            }
            
        }
        describe("SignupViewController"){
            context("When clicking signup, navigation to signup page is raised"){
                it("back to login with router"){
                    self.routerSpy = LoginRouterSpy()
                    self.signupViewController = SignupViewController()
                    self.signupViewController?.router = self.routerSpy
                    self.signupViewController?.viewDidLoad()
                    self.signupViewController?.handleLoginPressed()
                    expect(self.routerSpy?.loginPageCalled == true)
                }
            }
        }
        describe("LoginRouter"){
            context("When raised showsignuppage, signupViewController is shown"){
                beforeEach {
                    self.loginViewController = LoginFactory.makeLoginController() as? LoginViewController ?? LoginViewController()
                    
                    self.navigationController = UINavigationController(rootViewController: self.loginViewController ?? LoginViewController())
                }
                it("raise showsignuppage"){
                    self.loginViewController?.handleSignUpPressed()
                    
                    expect(self.navigationController?.topViewController is SignupViewController)
                    
                }
            }
        }
    }
}
