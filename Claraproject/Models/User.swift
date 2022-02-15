//
//  User.swift
//  Claraproject
//
//  Created by Clara Renauro on 2/11/22.
//

import Foundation
import UIKit
class User: Decodable {
    let id: Int
    let email, first_name, last_name, avatar: String
    
    init(id: Int, fname: String, lName: String, email: String){
        self.id = id
        first_name = fname
        last_name = lName
        self.avatar = "https://www.planetware.com/photos-large/N/norway-attractions-sognefjord.jpg"
        self.email = email
    }


}

class Result: Decodable {
    let total: Int
    let data: [User]
    }
