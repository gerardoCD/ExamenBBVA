//
//  TableController.swift
//  TestBBVA
//
//  Created by Gerardo on 12/13/18.
//  Copyright © 2018 Gerardo. All rights reserved.
//

import UIKit

class TableController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var responds = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        responds = UserDefaults.standard.array(forKey: "User") as! [String]
        
    }
    override func viewDidAppear(_ animated: Bool) {
        responds = UserDefaults.standard.array(forKey: "User") as! [String]
    }
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.removeObject(forKey: "User")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = responds[indexPath.row]
        return cell
    }

}
