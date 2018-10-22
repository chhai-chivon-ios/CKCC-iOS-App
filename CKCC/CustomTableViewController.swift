//
//  CustomTableViewController.swift
//  CKCC
//
//  Created by Bun Leap on 9/26/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_event") as! CustomTableViewCell
        cell.eventTitleLabel.text = "Event \(indexPath.row)"
        cell.eventDateLabel.text = "Date \(indexPath.row)"
        return cell
        
    }
    @IBAction func onRefreshControllPulled(_ sender: Any) {
        
        print("User pulled tableview")
        
    }
    
}
