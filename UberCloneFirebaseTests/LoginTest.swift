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
    override func spec(){
        describe("LoginViewController"){
            context("When clicking signup, navigation to signup page is raised"){
                beforeEach {
                    self.routerSpy = LoginRouterSpy()
                    self.loginViewController = LoginViewController()
                    self.loginViewController?.router = self.routerSpy
                }
                it("raise navigation on router"){
                    self.loginViewController?.handleSignUpPressed()
                    expect(self.routerSpy?.signupPageCalled == true)
                }
                
            }
        }
    }
}
