//
//  Meal+CoreDataClass.swift
//  FoodTracker
//
//  Created by Guilherme Trilha on 27/03/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import Foundation
import CoreData

@objc(Meal)
public class Meal: NSManagedObject {
    
    convenience init?(name: String, rating: Int64, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        let entity = NSEntityDescription.entity(forEntityName: "Meal", in: context)!
        self.init(entity: entity, insertInto: context)
        
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.rating = rating
    }
    
}
