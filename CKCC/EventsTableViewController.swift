//
//  EventsTableViewController.swift
//  CKCC
//
//  Created by Bun Leap on 9/26/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    // MARK: DataSource
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_event")!
        cell.backgroundColor = UIColor.gray
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 3
        } else {
            return 7
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Load prototype cell from storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_event")!
        cell.textLabel?.text = "Title \(indexPath.row)"
        cell.detailTextLabel?.text = "Subtitle \(indexPath.row)"
        return cell
        
    }

    // MARK: Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = "You click on row \(indexPath.row) of section \(indexPath.section)."
        showAlertMessage(title: "Delegate", message: message)
    }
    
    
    func showAlertMessage(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}






















