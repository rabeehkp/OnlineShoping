//
//  Mens_shirt+CoreDataClass.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit
@objc(Mens_shirt)
public class Mens_shirt: NSManagedObject {

    func getcontext () -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func StoreProduct(product_Name: String, product_Brand: String, product_Price: String ,product_Discount : String,product_Image : String) {
        let context = getcontext()
        
        
        let entity = NSEntityDescription.entity(forEntityName: "Mens_shirt", in: context)
        
        
        let mens_shirt = NSManagedObject(entity: entity!, insertInto: context)
        
        mens_shirt.setValue(product_Brand, forKey: "product_Brand")
        //UISwitch
        mens_shirt.setValue(product_Name, forKey: "product_Name")
        // UISwitch_snooze
        mens_shirt.setValue(product_Price, forKey: "product_Price")
        //weekdays
        mens_shirt.setValue(product_Discount, forKey: "product_Discount")
        //labelText
        mens_shirt.setValue(product_Image, forKey: "product_Image")
        
        do{
            try context.save()
            print("saved")
            
        } catch let error as NSError{
            print("not saved \(error), \(error.userInfo)")
        } catch{
            
        }
    }
    
    func fetchProduct() -> [Mens_shirt]?{
        var resultArray: [Mens_shirt]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName:"Mens_shirt")
        fetchRequest.predicate = NSPredicate(value:true)
        fetchRequest.returnsObjectsAsFaults = false
        do{
            resultArray = try getcontext().fetch(fetchRequest) as? [Mens_shirt]
            print("mens_shirt = \(resultArray!.count)")
        }
        catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        return resultArray
    }
    
    func filterBrand(key: String, argument_Array : String) -> [Mens_shirt]?{
        var resultArray: [Mens_shirt]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName:"Mens_shirt")
            fetchRequest.predicate = NSPredicate(format: "product_Brand = %@", argumentArray: [argument_Array])
        
        fetchRequest.returnsObjectsAsFaults = false
        do{
            resultArray = try getcontext().fetch(fetchRequest) as? [Mens_shirt]
            //print("collection of Brands = \(resultArray!.count)")
        }
        catch {
            print(error.localizedDescription)
            //fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        if let proper_results = resultArray, proper_results.count > 0{
            
//                let keywords = proper_results.map({ obj -> String in
//                    return obj.product_Brand!
//                })
//            return keywords
            return proper_results
        }
        else{
            return nil
        }
        
    }
    

}
