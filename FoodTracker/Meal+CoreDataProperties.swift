//
//  Meal+CoreDataProperties.swift
//  FoodTracker
//
//  Created by Guilherme Trilha on 29/03/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal");
    }

    @NSManaged public var name: String?
    @NSManaged public var photo: NSData?
    @NSManaged public var rating: Int64

}
