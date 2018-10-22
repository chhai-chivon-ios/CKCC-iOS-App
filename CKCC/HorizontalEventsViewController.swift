//
//  HorizontalEventsViewController.swift
//  CKCC
//
//  Created by Bun Leap on 10/22/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class HorizontalEventsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register EventCollectionViewCell to tableView
        let cellNib = UINib(nibName: "EventCollectionViewCell", bundle: nil)
        eventsCollectionView.register(cellNib, forCellWithReuseIdentifier: "cell_event")
        
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Generate item UI
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_event", for: indexPath) as! EventCollectionViewCell
        cell.eventTitleLabel.text = "Event \(indexPath.row)"
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User click on item: ", indexPath.row)
    }

}
