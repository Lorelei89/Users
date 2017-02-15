//
//  User.swift
//  UsersRaiffeisen
//
//  Created by Sabina Buruiana on 2/15/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation
class UsersWrapper {
    var users :[User]?
    let count:Int? = nil
    
}

enum UserFields: String {
    case Gender = "gender"
    case Name = "name"
    case Location = "location"
    case Email = "email"
    case Login = "login"
    case Phone = "phone"
    case Id = "id"
    case Picture = "picture"
    case Nationality = "nat"
}

class User {
    let gender: String?
    let name: [String:Any]?
    let location: [String:Any]?
    let email: String?
    let login: [String:Any]?
    let phone:String?
    let id:[String:Any]?
    let picture: [String:Any]?
    let nationality:String?
    
    
    required init(json: [String: Any]) {
        // strings
        self.gender = json[UserFields.Gender.rawValue] as? String
        
        self.name = json[UserFields.Name.rawValue] as? [String:Any]
        self.location = json[UserFields.Location.rawValue] as? [String:Any]
        self.email = json[UserFields.Email.rawValue] as? String
        
        self.login = json[UserFields.Login.rawValue] as? [String:Any]
        self.phone = json[UserFields.Phone.rawValue] as? String
        self.id = json[UserFields.Id.rawValue] as? [String:Any]
        
    
        self.picture = json[UserFields.Picture.rawValue] as? [String:Any]
        self.nationality = json[UserFields.Nationality.rawValue] as? String
        
        
    }
}
