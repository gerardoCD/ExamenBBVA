//
//  SecoundTableViewController.swift
//  TestBBVA
//
//  Created by Gerardo on 12/13/18.
//  Copyright © 2018 Gerardo. All rights reserved.
//

import UIKit

class SecoundTableViewController: UITableViewController {
    var history = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        history = CoreData.retrieveData()

    }
    override func viewDidAppear(_ animated: Bool) {
        history = CoreData.retrieveData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return history.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = history[indexPath.row]

        return cell
    }

}
