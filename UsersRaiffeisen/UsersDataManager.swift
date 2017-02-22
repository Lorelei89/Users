//
//  UsersDataManager.swift
//  UsersRaiffeisen
//
//  Created by Sabina Buruiana on 2/15/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation
import Alamofire

class UsersDataManager {
    
    
    func endpointForUsers() -> String {
        return "https://randomuser.me/api/?page=0&results=100&seed=abc/"
    }
    
//    func getUsers(_ completionHandler: @escaping (Result<UsersWrapper>) -> Void) {
//        UserServices().getUsersAtPath(self.endpointForUsers(), completionHandler: completionHandler)
//    }
}
