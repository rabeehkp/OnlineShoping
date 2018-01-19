//
//  BrandsForGents+CoreDataClass.swift
//  DemoApp
//
//  Created by Rabeeh KP on 08/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(BrandsForGents)
public class BrandsForGents: NSManagedObject {

    func getcontext () -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func StoreProduct(product_Name: String, product_Brand: String, product_Price: String ,product_Discount : String,product_Image : String) {
        let context = getcontext()
        
        
        let entity = NSEntityDescription.entity(forEntityName: "BrandsForGents", in: context)
        
        
        let brandsForGents = NSManagedObject(entity: entity!, insertInto: context)
        
        brandsForGents.setValue(product_Brand, forKey: "product_Brand")
        //UISwitch
        brandsForGents.setValue(product_Name, forKey: "product_Name")
        // UISwitch_snooze
        brandsForGents.setValue(product_Price, forKey: "product_Price")
        //weekdays
        brandsForGents.setValue(product_Discount, forKey: "product_Discount")
        //labelText
        brandsForGents.setValue(product_Image, forKey: "product_Image")
        
        do{
            try context.save()
            print("saved")
            
        } catch let error as NSError{
            print("not saved \(error), \(error.userInfo)")
        } catch{
            
        }
        
    }
    
    
    
    func fetchProduct() -> [BrandsForGents]?{
        var resultArray: [BrandsForGents]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName:"BrandsForGents")
        fetchRequest.predicate = NSPredicate(value:true)
        fetchRequest.returnsObjectsAsFaults = false
        do{
            resultArray = try getcontext().fetch(fetchRequest) as? [BrandsForGents]
            print("product_for_gents = \(resultArray!.count)")
        }
        catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        return resultArray
    }
    
    // update savedtimes
    
    func updateProduct(object: BrandsForGents, newTime:String, isAlarmOn: Bool, isSnoozeOn: Bool, updateWeekday: String, editLabel: String)  {
        let context = getcontext()
        object.product_Brand = product_Brand
        //UISwitch
        object.product_Name = product_Name
        //Snooze
        object.product_price = product_price
        //weekdayUpdate
        object.product_Discount = product_Discount
        //LabelEdit
        object.product_Image = product_Image
        do {
            try context.save()
            print("updated!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    // delete data from coredata
    
    func deleteSavedtimes(object:BrandsForGents) {
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
