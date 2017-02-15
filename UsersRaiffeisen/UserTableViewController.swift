//
//  UserTableViewController.swift
//  DemoApp
//
//  Created by Sabina Buruiana on 2/14/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

private let reuseIdentifier = "userCollectionViewCellIdentifier"

class UserTableViewController: UITableViewController {

    @IBOutlet var userTableView: UITableView!
    
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()

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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result : UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        switch indexPath.item {
        case 0:
           break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
        
        return result
    }
    

}
