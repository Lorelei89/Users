//
//  User.swift
//  UsersRaiffeisen
//
//  Created by Sabina Buruiana on 2/15/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation
import SwiftyJSON

class UsersWrapper {
    var users :[User]?
    let count:Int? = nil
    
}

enum NameFields: String {
    case Title = "Title"
    case First = "first"
    case Last = "last"
}
enum LocationFields: String {
    case Street = "street"
    case City = "city"
    case State = "state"
    case Postcode = "postcode"
}
enum LoginFields: String {
    case Username = "username"
    case Password = "password"
}
enum PictureFields: String {
    case Large = "large"
    case Medium = "medium"
    case Thumbnail = "thumbnail"
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
    var gender: String?
    var objName:JSON?
    var objLocation:JSON?
    var email: String?
    var objLogin:JSON?
    var phone:String?
    var objId:JSON?
    var objPicture:JSON?
    var nationality:String?
    var objUser:JSON?
    
    
//    required init(json: [String: Any]) {
//        // strings
//        self.gender = json[UserFields.Gender.rawValue] as? String
//        
//        self.name = json[UserFields.Name.rawValue] as? [String:Any]
//        self.location = json[UserFields.Location.rawValue] as? [String:Any]
//        self.email = json[UserFields.Email.rawValue] as? String
//        
//        self.login = json[UserFields.Login.rawValue] as? [String:Any]
//        self.phone = json[UserFields.Phone.rawValue] as? String
//        self.id = json[UserFields.Id.rawValue] as? [String:Any]
//        
//    
//        self.picture = json[UserFields.Picture.rawValue] as? [String:Any]
//        self.nationality = json[UserFields.Nationality.rawValue] as? String
//        
//        
//    }
    
    required init(json: JSON) {
        for result in json["results"].arrayValue {
            //(json.dictionaryValue)["object"]! as JSON).dictionaryValue)["sub_name"]! as JSON).string!, "sub_name")
            self.gender = result[UserFields.Gender.rawValue].stringValue
            
            let namesDictionary = result[UserFields.Name.rawValue].arrayValue
            for nameDictionary in namesDictionary {
                let title = nameDictionary["title"].stringValue
                let firstName = nameDictionary["first"].stringValue
                let lastName = nameDictionary["last"].stringValue
                self.objName = ["title": title, "firstName": firstName, "lastName": lastName]
            }
            
            let locationsDictionary = result[UserFields.Location.rawValue].arrayValue
            
            for locationDictionary in locationsDictionary {
                let street = locationDictionary["title"].stringValue
                let city = locationDictionary["city"].stringValue
                let state = locationDictionary["state"].stringValue
                let postcode = locationDictionary["postcode"].intValue
                self.objLocation = ["street": street, "city": city, "state": state,"postcode": postcode]
            }
            self.email = result[UserFields.Email.rawValue].stringValue
            
            let loginsDictionary = result[UserFields.Login.rawValue].arrayValue
            for loginDictionary in loginsDictionary {
                let username = loginDictionary["username"].stringValue
                let password = loginDictionary["password"].stringValue
                let salt = loginDictionary["salt"].stringValue
                self.objLogin = ["username": username, "password": password, "salt": salt]
            }
            
            self.phone = result[UserFields.Phone.rawValue].stringValue
            
            let idsDictionary = result[UserFields.Id.rawValue].arrayValue
            for idDictionary in idsDictionary {
                let name = idDictionary["username"].stringValue
                let value = idDictionary["password"].stringValue
                self.objId = ["name": name, "value": value]
            }
            
             let picturesDictionary = result[UserFields.Picture.rawValue].arrayValue
             for pictureDictionary in picturesDictionary {
                let large = pictureDictionary["large"].stringValue
                let medium = pictureDictionary["medium"].stringValue
                let thumbnail = pictureDictionary["thumbnail"].stringValue
                self.objPicture = ["large": large, "medium": medium, "thumbnail":thumbnail]
            }
            
             self.nationality = result[UserFields.Nationality.rawValue].stringValue
            
            self.objUser = ["gender" : gender ?? nil, "objName" : self.objName ?? nil, "email" : self.email ?? nil, "objLogin " : self.objLogin, "phone" : self.phone ?? nil , "objId " : self.objId ,"objPicture" : self.objPicture ?? nil ,"nationality" : self.nationality ?? nil ]
            
        }
    }
    
}
