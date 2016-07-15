//
//  NotesTableViewController.swift
//  CoolNotes
//
//  Created by Wong, Ryan C on 7/15/16.
//  Copyright © 2016 Wong, Ryan C. All rights reserved.
//

import Foundation
import UIKit

class NotesTableViewController: CoreDataTableViewController {
    
    @IBAction func addNewNote(sender: AnyObject){
        //if let nb = notebook, context = fetchedResultsController?.managedObjectContext{
            
            // Just create a new note and you're done!
            //let note = Note(text: "New Note", context: context)
            //note.notebook = nb
            
        //}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:  - TableView Data Source
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Get the note
        let note = fetchedResultsController?.objectAtIndexPath(indexPath) as! Note
        
        // Get the cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Note", forIndexPath: indexPath)
        
        // Sync note -> cell
        cell.textLabel?.text = note.text
        
        // Return the cell
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}