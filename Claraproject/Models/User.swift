//
//  User.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/11/22.
//

import Foundation

class User: Decodable {
    let id: Int
    let email, first_name, last_name, avatar: String
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case email
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case avatar = "avatar"
//    }
}

class Result: Decodable {
    let total: Int
    let data: [User]
}
