//
//  Note+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Wong, Ryan C on 7/14/16.
//  Copyright © 2016 Wong, Ryan C. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var creationDate: NSDate?
    @NSManaged var text: String?
    @NSManaged var notebook: NSManagedObject?

}
