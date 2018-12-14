//
//  CoreData.swift
//  TestBBVA
//
//  Created by Gerardo on 12/13/18.
//  Copyright © 2018 Gerardo. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CoreData{
    static func createData(url:String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "History", in: managedContext)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue(url, forKeyPath: "url")
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    static func retrieveData() -> [String]{
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "History")
        var results = [String]()
        do {
            let result = try managedContext?.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                
                results.append(data.value(forKey: "url") as! String)
            }
            
        } catch {
            print("Failed")
        }
        return results
    }

}
