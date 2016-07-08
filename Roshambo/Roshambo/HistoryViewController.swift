//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Wong, Ryan C on 7/8/16.
//  Copyright © 2016 Ryan. All rights reserved.
//

import Foundation
import UIKit
class HistoryViewController:UIViewController,UITableViewDelegate, UITableViewDataSource {
    var history = [matches]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Table View Delegate
    //gets the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    //populate and reuse the cells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let CellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellID, forIndexPath: indexPath)
        
        let match = self.history[indexPath.row]
        print(match.myMove)
        print(match.opMove)
        cell.textLabel!.text = victoryStatusDescription(match)
        var detail = match.myMove + " VS " + match.opMove
        print(detail)
        cell.detailTextLabel!.text = detail
        
        
        return cell
    }
    //finds out who won
    func victoryStatusDescription(match: matches) -> String {
        if (match.won != nil){
            if (match.won == true) {
                return "Win!"
            } else{
                return "Loss."
            }
        } else {
            return "Tie."
        }
    }
    //leaves the history view
    @IBAction func dismissHistory(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}