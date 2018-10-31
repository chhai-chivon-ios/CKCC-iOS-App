//
//  CustomTableViewController.swift
//  CKCC
//
//  Created by Bun Leap on 9/26/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit
import SDWebImage

class CustomTableViewController: UITableViewController {
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load list of events from Web Service
        let url = URL(string: "http://test.js-cambodia.com/ckcc/events.php")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            let events = try! jsonDecoder.decode([Event].self, from: data!)
            self.events = events
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_event") as! CustomTableViewCell
        
        let event = events[indexPath.row]
        
        cell.eventTitleLabel.text = event.title
        cell.eventDateLabel.text = event.date
        
        // Load event image using build-in API
        /*let url = URL(string: event.imageUrl)!
        let tastk = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                cell.eventImageView.image = image
            }
        }
        tastk.resume()*/
        
        // Load image using SD Web Image library
        let url = URL(string: event.imageUrl)!
        cell.eventImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "ic_gallery"), options: .cacheMemoryOnly, completed: nil)
        
        return cell
        
    }
    @IBAction func onRefreshControllPulled(_ sender: Any) {
        
        print("User pulled tableview")
        
    }
    
}
