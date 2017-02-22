//
//  UserServices.swift
//  UsersRaiffeisen
//
//  Created by Sabina Buruiana on 2/15/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

class UserServices {
    
//   func getUsersAtPath(_ path: String, completionHandler: @escaping (Result<UsersWrapper>) -> Void) {
//        // make sure it's HTTPS because sometimes the API gives us HTTP URLs
//        guard var urlComponents = URLComponents(string: path) else {
//            let error = BackendError.urlError(reason: "Tried to load an invalid URL")
//            completionHandler(.failure(error))
//            return
//        }
//        urlComponents.scheme = "https"
//        guard let url = try? urlComponents.asURL() else {
//            let error = BackendError.urlError(reason: "Tried to load an invalid URL")
//            completionHandler(.failure(error))
//            return
//        }
//        let _ = Alamofire.request(url)
//            .responseJSON { response in
//                if let error = response.result.error {
//                    completionHandler(.failure(error))
//                    return
//                }
//                let usersWrapperResult = self.usersArrayFromResponse(response)
//                completionHandler(usersWrapperResult)
//        }
//    }
// 
//     func usersArrayFromResponse(_ response: DataResponse<Any>) -> Result<UsersWrapper> {
//        guard response.result.error == nil else {
//            // got an error in getting the data, need to handle it
//            print(response.result.error!)
//            return .failure(response.result.error!)
//        }
//        
//        // make sure we got JSON and it's a dictionary
//        guard let json = response.result.value as? [String: Any] else {
//            print("didn't get species object as JSON from API")
//            return .failure(BackendError.objectSerialization(reason:
//                "Did not get JSON dictionary in response"))
//        }
//        
//        let wrapper: UsersWrapper = UsersWrapper()
//        
//        var allUsers: [User] = []
//        if let results = json["results"] as? [[String: Any]] {
//            for jsonUsers in results {
//                let users = User(json: jsonUsers)
//                allUsers.append(users)
//            }
//        }
//        wrapper.users = allUsers
//        return .success(wrapper)
//    }
    
//    func fetchUsers(){
//        var users:[[String:String]]
//          let urlString = "https://randomuser.me/api/?page=0&results=100&seed=abc/"
//        if let url = URL(string: urlString) {
//            if let data = try? Data(contentsOf: url) {
//                let json = JSON(data: data)
//                    let user = User(json: json)
//                    users.apppend(user)
//
//            }
//        }
//
//    }
//    
}
