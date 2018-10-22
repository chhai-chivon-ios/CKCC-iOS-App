//
//  CousesViewController.swift
//  CKCC
//
//  Created by Bun Leap on 10/17/18.
//  Copyright © 2018 Cambodia-Korea Cooperation Center. All rights reserved.
//

import UIKit

class CousesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register CourseTableViewCell to tableView
        let courseTableViewCellNib = UINib(nibName: "CourseTableViewCell", bundle: nil)
        tableView.register(courseTableViewCellNib, forCellReuseIdentifier: "cell_course")
        
        // Apply data source and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set table footer
        let tableFooterView = Bundle.main.loadNibNamed("CourseTableFooterView", owner: nil, options: nil)![0] as! CourseTableFooterView
        tableFooterView.rowNumberLabel.text = "10"
        tableView.tableFooterView = tableFooterView
    }

    // MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Load CourseTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_course") as! CourseTableViewCell
        cell.courseTitleLabel.text = "Course \(indexPath.row)"
        
        return cell
    }
    
    // MARK: - Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCells = tableView.indexPathsForVisibleRows!
        let lastVisibleCell = visibleCells.last!.row
        if lastVisibleCell == 49 {
            print("Reach footer")
        }
    }

}











