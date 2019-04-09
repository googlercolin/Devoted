//
//  PrayerListTableViewController.swift
//  Devoted
//
//  Created by Colin Hong on 4/5/19.
//  Copyright © 2019 Colin Hong. All rights reserved.
//

import UIKit

class PrayerListTableViewController: UITableViewController {

    var prayerTitles : [prayerTitleList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prayerTitles = createPrayerTitle()
    }
    
    func createPrayerTitle() -> [prayerTitleList] {
        
        let exams = prayerTitleList()
        exams.content = "My exams"
        exams.important = true
        
        let dog = prayerTitleList()
        dog.content = "Dog's health"
        
        let mom = prayerTitleList()
        mom.content = "Mom's work"
        mom.important = true
        
        return[exams,dog,mom]
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prayerTitles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prayerTitleCell = tableView.dequeueReusableCell(withIdentifier: "prayer_title_cell", for: indexPath)
        let prayerTitle = prayerTitles[indexPath.row]
        if prayerTitle.important{
            prayerTitleCell.textLabel?.text = "❗️" + prayerTitle.content
        } else {
            prayerTitleCell.textLabel?.text = prayerTitle.content

        }
        
        return prayerTitleCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prayerTitle = prayerTitles[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: prayerTitle)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? addPrayerViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? prayerDetailsViewController {
            
            if let prayerTitle = sender as? prayerTitleList {
                completeVC.selectedPrayerTitle = prayerTitle
                completeVC.previousVC = self
            }
        }
    }

}
