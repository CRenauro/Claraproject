//
//  User.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/11/22.
//

import Foundation

class User: Decodable {
    var id: Int?
    var first_name: String
    var last_name: String
    var avatar: String
    var email: String
    var image: Data?
    
    init(image: String, first: String, last: String, myEmail: String){
        first_name = first
        last_name = last
        avatar = image
        email = myEmail
        let image = Downloader.downloadImageWithURL(url: avatar)
    }
    enum CodingKeys: String, CodingKey{
        case id
        case email
        case first_name = "first_name"
        case last_name = "last_name"
        case avatar = "avatar"
    }
}

class Result: Decodable {
    let total: Int
    let data: [User]
}

class Result2: Decodable {
    let total: Int
    let data: User
    

}
