
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
    
    var users = [User]()
    var isLoadingSpecies = false
    
    @IBOutlet var usersCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
   
        setupCollectionView()
        loadFirstUsers()
        // Do any additional setup after loading the view.
    }
    
    //MARK: CollectionView Setup
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 120, height: 120)
        
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
        // Register cell classes
        self.usersCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.usersCollectionView.register(UserCollectionViewCell.self, forCellWithReuseIdentifier:reuseIdentifier)
    
    }
    
    // MARK: Loading Users from API
    
    func loadFirstUsers() {
        isLoadingSpecies = true
        UsersDataManager().getUsers({ result in
            if let error = result.error {
                // TODO: improved error handling
                self.isLoadingSpecies = false
                let alert = UIAlertController(title: "Error", message: "Could not load first users :( \(error.localizedDescription)", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            if let users = result.value?.users{
                self.users = users
            }

            print(self.users)
            self.isLoadingSpecies = false
            self.usersCollectionView?.reloadData()
        })
    }


    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! UserCollectionViewCell
    
        // Configure the cell
//        cell.userPhoto.image = UIImage(named:self.photo(forRowAt: indexPath))
       // cell.nameLabel.text = self.name(forRowAt: indexPath)
     //   cell.jobLabel.text = "HR"
        return cell
    }
    
    
    func name(forRowAt indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < self.users.count else {
            return ""
        }
        
        let firstName = self.users[indexPath.row].name!["first"] as! String
        let lastName = self.users[indexPath.row].name!["last"] as! String
        return firstName + lastName
    }
    
    func photo(forRowAt indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < self.users.count else {
            return ""
        }
        
        let photo = self.users[indexPath.row].picture!["medium"] as! String
        return photo
    }
    
    //MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         self.performSegue(withIdentifier: "", sender: indexPath)
    }
    

    //MARK: - UICollectionViewFlowLayout
    
    //Use for size
    func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let screenWidth = UIScreen.main.bounds.size.width
        let twoPicesWith = screenWidth / CGFloat(NUMBER_OF_ITEMS) - CGFloat(NUMBER_OF_SPACES ) * (CGFloat(MINIMUM_INTERIMITEM_SPACE)/CGFloat(NUMBER_OF_ITEMS))
        let size = CGSize(width: twoPicesWith, height: twoPicesWith)
        return size
        
    }
    
    //Use for interspacing
    func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
       return CGFloat(MINIMUM_INTERIMITEM_SPACE)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 minimumLineSpacingForSectionAt section: Int) -> CGFloat{

        
        return CGFloat(MINIMUM_INTERIMITEM_SPACE)
    }

}
