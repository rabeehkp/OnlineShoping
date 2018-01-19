//
//  BrandsForLadies+CoreDataClass.swift
//  DemoApp
//
//  Created by Rabeeh KP on 08/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(BrandsForLadies)
public class BrandsForLadies: NSManagedObject {
    func getcontext () -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func StoreProduct(product_Name: String, product_Brand: String, product_Price: String ,product_Discount : String,product_Image : String) {
        let context = getcontext()
        
        
        let entity = NSEntityDescription.entity(forEntityName: "BrandsForLadies", in: context)
        
        
        let brandsForLadies = NSManagedObject(entity: entity!, insertInto: context)
        
        brandsForLadies.setValue(product_Brand, forKey: "product_Brand")
   
        brandsForLadies.setValue(product_Name, forKey: "product_Name")
      
        brandsForLadies.setValue(product_Price, forKey: "product_Price")
       
        brandsForLadies.setValue(product_Discount, forKey: "product_Discount")
      
        brandsForLadies.setValue(product_Image, forKey: "product_Image")
        
        do{
            try context.save()
            print("saved")
            
        } catch let error as NSError{
            print("not saved \(error), \(error.userInfo)")
        } catch{
            
        }
        
    }
    
    
    
    func fetchProduct() -> [BrandsForLadies]?{
        var resultArray: [BrandsForLadies]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName:"BrandsForGents")
        fetchRequest.predicate = NSPredicate(value:true)
        fetchRequest.returnsObjectsAsFaults = false
        do{
            resultArray = try getcontext().fetch(fetchRequest) as? [BrandsForLadies]
            print("product_for_Ladies = \(resultArray!.count)")
        }
        catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        return resultArray
    }
    
    // update savedtimes
    
    func updateProduct(object: BrandsForLadies, update_product_Name: String, update_product_Brand: String, update_product_Price: String ,update_product_Discount : String,update_product_Image : String)  {
        let context = getcontext()
        object.product_Brand = update_product_Brand
        //UISwitch
        object.product_Name = update_product_Name
        //Snooze
        object.product_price = update_product_Price
        //weekdayUpdate
        object.product_Discount = update_product_Discount
        //LabelEdit
        object.product_Image = update_product_Image
        do {
            try context.save()
            print("updated!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    // delete data from coredata
    
    func deleteProduct(object:BrandsForLadies) {
        let context = getcontext()
        do {
            context.delete(object)
            print("deleted!")
            do {
                try context.save()
                // print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
        }
    }
}
