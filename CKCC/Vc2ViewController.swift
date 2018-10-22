//
//  Vc2ViewController.swift
//  CKCC
//
//  Created by Bun Leap on 9/17/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class Vc2ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.text = name
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = nameTextField.text
    }
    
}
