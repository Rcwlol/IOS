//
//  Note.swift
//  CoolNotes
//
//  Created by Wong, Ryan C on 7/14/16.
//  Copyright © 2016 Wong, Ryan C. All rights reserved.
//

import Foundation
import CoreData


class Note: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(text: String = "New Note", context: NSManagedObjectContext){
        if let ent = NSEntityDescription.entityForName("Note", inManagedObjectContext: context){
            self.init(entity: ent,insertIntoManagedObjectContext: context)
            self.text = text
            self.creationDate = NSDate()
        }else{
            fatalError("Unable to find Entity name!")
        }
        
    }
    
    var humanReadableAge : String{
        get{
            let fmt = NSDateFormatter()
            fmt.timeStyle = .NoStyle
            fmt.dateStyle = .ShortStyle
            fmt.doesRelativeDateFormatting = true
            fmt.locale = NSLocale.currentLocale()
            
            return fmt.stringFromDate(creationDate!)
        }
        
    }

}
