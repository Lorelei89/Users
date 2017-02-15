//
//  UserTableViewController.swift
//  DemoApp
//
//  Created by Sabina Buruiana on 2/14/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

private let reuseIdentifier = "userTableViewCellIndentifier"

class UserTableViewController: UITableViewController {

    @IBOutlet var userTableView: UITableView!
    var isLoadingSpecies = false
    
  
    var userTitleInfoArray = ["Username","Email","Phone","Address","ID"]
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFirstUsers()

    }

    
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
            self.userTableView?.reloadData()
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // return the date-section
        let header = tableView.dequeueReusableCell(withIdentifier: "userHeaderViewIndentifier") as! UserHeaderViewCell
        
        return header.contentView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UserTableViewCell {
        let cell  =  tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserTableViewCell
        cell.userTitleInfo.text = userTitleInfoArray[indexPath.row]
        switch indexPath.item {
        case 0:
           break
        case 1:
            cell.userTitleInfo.text = userName(forRowAt: indexPath)
        case 2:
            cell.userTitleInfo.text = self.users[indexPath.row].email
        case 3:
            cell.userTitleInfo.text = self.users[indexPath.row].phone
        case 4:
            cell.userTitleInfo.text = "Address bla bla bla"
        case 5:
            cell.userTitleInfo.text = id(forRowAt: indexPath)
        default:
            break
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }
    
    func userName(forRowAt indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < self.users.count else {
            return ""
        }
        
        let userName = self.users[indexPath.row].login?["username"] as! String
        return userName
    }
    
    func id(forRowAt indexPath: IndexPath) -> String {
        guard indexPath.row >= 0 && indexPath.row < self.users.count else {
            return ""
        }
        
        let userName = self.users[indexPath.row].id?["value"]as! String
        return userName
    }

}
