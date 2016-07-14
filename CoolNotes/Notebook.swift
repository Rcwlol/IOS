//
//  Notebook.swift
//  CoolNotes
//
//  Created by Wong, Ryan C on 7/14/16.
//  Copyright © 2016 Wong, Ryan C. All rights reserved.
//

import Foundation
import CoreData


class Notebook: NSManagedObject {
    
    convenience init(name: String, context: NSManagedObjectContext){
        if let ent = NSEntityDescription.entityForName("Notebook", inManagedObjectContext: context){
            self.init(entity: ent,insertIntoManagedObjectContext: context)
            self.name = name
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
