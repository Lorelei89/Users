
//
//  UsersCollectionViewController.swift
//  DemoApp
//
//  Created by Sabina Buruiana on 2/14/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

private let reuseIdentifier = "userCollectionViewCellIdentifier"

private let NUMBER_OF_ITEMS = 2.0
private let MINIMUM_INTERIMITEM_SPACE = 5.0
private let NUMBER_OF_SPACES = 3.0

class UsersCollectionViewController: UICollectionViewController {
    
    var users : [[String:String]]?
    var isLoadingSpecies = false
    var usersWrapper: UsersWrapper? // holds the last wrapper that we've loaded
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
    
    @IBOutlet var usersCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://randomuser.me/api/?page=0&results=100&seed=abc/"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
            
                    parse(json: json)
                    return
    
            }
        }
        
        showError()
        
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func parse(json: JSON) {
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
           // self.users?.append(self.objUser)
            
            
        }
         usersCollectionView.reloadData()
    }
    
    //MARK: CollectionView Setup
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
        // Register cell classes
        
        self.usersCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.usersCollectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier:reuseIdentifier)
    
    }
    
    // MARK: Loading Users from API
    


    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.users!.count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! UserCollectionViewCell
    
        // Configure the cell
//        cell.userPhoto.image = UIImage(named:self.photo(forRowAt: indexPath))
//        cell.nameLabel.text = self.name(forRowAt: indexPath)
//        cell.jobLabel.text = "HR"
        return cell
    }
    
//    func addUsersFromWrapper(_ wrapper: UsersWrapper?) {
//        self.usersWrapper = wrapper
//         if self.users == nil {
//         self.users = self.usersWrapper?.users
//        }
//    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    
//    func name(forRowAt indexPath: IndexPath) -> String {
//        guard indexPath.row >= 0 && indexPath.row < (self.users?.count)! else {
//            return ""
//        }
//        
//        let firstName = self.users?[indexPath.row].name!["first"] as! String
//        let lastName = self.users?[indexPath.row].name!["last"] as! String
//        return firstName + lastName
//    }
//    
//    func photo(forRowAt indexPath: IndexPath) -> String {
//        guard indexPath.row >= 0 && indexPath.row < (self.users?.count)! else {
//            return ""
//        }
//        
//        let photo = self.users?[indexPath.row].picture!["medium"] as! String
//        return photo
//    }
    
    //MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         self.performSegue(withIdentifier: "", sender: indexPath)
    }
    

}
