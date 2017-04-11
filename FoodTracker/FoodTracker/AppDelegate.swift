//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 10/17/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let stack = CoreDataStack(modelName: "Model")!

    func preloadData(){
        do {
            try stack.dropAllData()
        } catch {
            print("Error droping all objects in DB")
        }
        
        //Create Meals
        createSamples()
        
    }
    
    //MARK: Private Methods
    
    private func createSamples() {
        let caprese = Meal(name: "Caprese Salad", rating: 4, insertIntoManagedObjectContext: stack.context)
        let chicken = Meal(name: "Chicken and Potatoes", rating: 5, insertIntoManagedObjectContext: stack.context)
        let pasta = Meal(name: "Pasta with Meatballs", rating: 3, insertIntoManagedObjectContext: stack.context)
        
        print(caprese)
        print(chicken)
        print(pasta)
    }

    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //preloadData()
        stack.autoSave(60)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        do {
            try stack.saveContext()
        } catch {
            print("Error while saving.")
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        do {
            try stack.saveContext()
        } catch {
            print("Error while saving.")
        }
    }
}

