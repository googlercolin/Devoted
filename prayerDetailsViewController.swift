//
//  prayerDetailsViewController.swift
//  Devoted
//
//  Created by Colin Hong on 4/9/19.
//  Copyright © 2019 Colin Hong. All rights reserved.
//

import UIKit

class prayerDetailsViewController: UIViewController {

    var previousVC = PrayerListTableViewController()
    var selectedPrayerTitle = prayerTitleList()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedPrayerTitle.content
    }

    @IBAction func completeTapped(_ sender: Any) {
        var index = 0
        for somePrayer in previousVC.prayerTitles{
            if somePrayer.content == selectedPrayerTitle.content {
                previousVC.prayerTitles.remove(at: index)
                previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
    }
    
}
