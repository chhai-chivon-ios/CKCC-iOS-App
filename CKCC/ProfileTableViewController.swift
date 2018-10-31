//
//  ProfileTableViewController.swift
//  CKCC
//
//  Created by Bun Leap on 10/24/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load profile from Web Service
        let url = URL(string: "http://test.js-cambodia.com/ckcc/profile.php?id=1")!
        //let url = URL(string: "http://localhost/test/ckcc/profile.php")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("Request completed")
            // Decode json data to object
            let decoder = JSONDecoder()
            
            if let profile = try? decoder.decode(Profile.self, from: data!) {
                DispatchQueue.main.async {
                    self.nameLabel.text = profile.name
                    self.majorLabel.text = profile.major
                    self.genderLabel.text = profile.gender
                    self.dobLabel.text = profile.dob
                }
                self.loadProfileImage(profileImageUrl: profile.imageUrl)
            } else {
                print("Decode data error...")
            }
        }
        print("Start requesting to server...")
        task.resume()
    }
    
    private func loadProfileImage(profileImageUrl: String){
        let url = URL(string: profileImageUrl)!
        let tastk = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
        }
        tastk.resume()
    }

}

















