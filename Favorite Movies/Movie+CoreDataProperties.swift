//
//  Movie+CoreDataProperties.swift
//  Favorite Movies
//
//  Created by Ryan Collins on 4/19/16.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var link: String?

}
