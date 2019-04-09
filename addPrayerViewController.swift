//
//  addPrayerViewController.swift
//  Devoted
//
//  Created by Colin Hong on 4/7/19.
//  Copyright © 2019 Colin Hong. All rights reserved.
//

import UIKit

class addPrayerViewController: UIViewController {
    
    var previousVC = PrayerListTableViewController()

    @IBOutlet weak var prayerTitleTextField: UITextField!
    @IBOutlet weak var prioritySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let someprayerTitle = prayerTitleList()
        
        if let prayerTitleText = prayerTitleTextField.text{
            someprayerTitle.content = prayerTitleText
            someprayerTitle.important = prioritySwitch.isOn
            previousVC.prayerTitles.append(someprayerTitle)
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
    }
    
}

