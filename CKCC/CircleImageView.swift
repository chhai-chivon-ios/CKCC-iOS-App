//
//  CircleImageView.swift
//  CKCC
//
//  Created by Bun Leap on 9/19/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    override func awakeFromNib() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }

}
