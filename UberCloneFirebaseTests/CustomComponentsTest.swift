//
//  CustomComponentsTest.swift
//  UberCloneFirebaseTests
//
//  Created by Mateus Santos on 09/11/21.
//


import Quick
import Nimble
@testable import UberCloneFirebase

class CustomComponentsTest: QuickSpec {

    override func spec(){
        var customTextField : CustomTextField?
        describe("The CustomTextField"){
            context("When isPassword is set true, the inner text field is a secure textfield"){
                afterEach{
                    customTextField = nil
                }
                beforeEach {
                    customTextField = CustomTextField(image: nil, placeholder: "Teste", isPassword: true)
                }
                it("isSecureTextField"){
                    expect(customTextField?.textInput.isSecureTextEntry == true)
                }
            }
        }
    }
}
