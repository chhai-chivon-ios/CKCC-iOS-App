//
//  Vc1ViewController.swift
//  CKCC
//
//  Created by Bun Leap on 9/17/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class Vc1ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue_to_vc2" {
        
            /*
            // In case Vc2ViewController is inside another NavigationController
            let navigationController = segue.destination as! UINavigationController
            let vc2 = navigationController.viewControllers[0] as! Vc2ViewController
            vc2.name = nameTextField.text
            */
            
            let vc2 = segue.destination as! Vc2ViewController
            vc2.name = nameLabel.text
        
        }
        
    }
    
    @IBAction func onVc2SaveButtonClick(_ segue: UIStoryboardSegue){
        
        print("onVc2SaveButtonClick")
        let vc2 = segue.source as! Vc2ViewController
        nameLabel.text = vc2.name
        
    }

}
