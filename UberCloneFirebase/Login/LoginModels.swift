//
//  LoginModels.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
}

struct SignupViewModel {
    var email: String?
    var name: String?
    var password: String?
    var userType: UserType?
    
}


struct LoginModel : Codable {
    let email : String
    let password : String
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
}

struct UserModel : Codable {
    let name: String
    let email: String
    let type: UserType
    let uid: String
}

struct SignupModel : Codable {
    let name: String
    let email: String
    let password: String
    let type: UserType
}

enum LoginError : Error {
    case NetworkError
}


enum UserType : String, Codable {
    case driver
    case rider
    
    enum UserTypeCodingKeys : String, CodingKey {
        case driver = "driver"
        case rider = "rider"
    }
    
    func asString() -> String {
        switch self {
        case .driver:
            return "driver"
        case .rider:
            return "rider"
        }
    }
    
}
