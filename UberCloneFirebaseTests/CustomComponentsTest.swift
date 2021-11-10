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
        
        describe("The HexToUIColor Extension"){
            context("When passing a valid 4 bytes hex string ex(#123123ff) returns a UIColor"){
                it("is a valid hex"){
                    let uicolor = UIColor(hex: "#ffaa2233")
                    
                    expect(uicolor != nil)
                    
                }
                it("is a invalid hex") {
                    let uicolor = UIColor(hex:"batatinha")
                    expect(uicolor == nil)
                }
            }
        }
        
        describe("CustomTextFieldDelegate"){
            context("When text is edited, delegate works"){
                afterEach{
                    customTextField = nil
                }
                beforeEach {
                    customTextField = CustomTextField(image: nil, placeholder: "Teste", isPassword: true)
                }
                it("raises delegate, updating the value"){
                    let delegate = CustomTextFieldDelegateMock()
                    customTextField?.delegate = delegate
                    customTextField?.textInput.text = "Teste"
                    customTextField?.handleTextChanged()
                    expect(delegate.value == "Teste")
                }
            }
        }
    }
}


class CustomTextFieldDelegateMock : CustomTextFieldDelegate {
    var value = ""
    func didFinishEditing(_: CustomTextField, value: String) {
        self.value = value
    }
}
