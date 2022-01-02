//
//  LoginModels.swift
//  UberCloneFirebase
//
//  Created by Mateus Moura Santos on 02/01/22.
//

import Foundation

struct LoginModel : Codable {
    let email : String
    let password : String
}

struct UserModel : Codable {
    let name: String
    let email: String
    let type: UserType
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
}
