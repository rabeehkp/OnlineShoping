//
//  Add_Cart+CoreDataClass.swift
//  DemoApp
//
//  Created by Rabeeh KP on 20/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Add_Cart)
public class Add_Cart: NSManagedObject {
    func getcontext () -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func StoreProduct(product_Name: String, product_Brand: String, product_Price: String ,product_Discount : String,product_Image : String) {
        let context = getcontext()
        let entity = NSEntityDescription.entity(forEntityName: "Add_Cart", in: context)
        let add_Cart = NSManagedObject(entity: entity!, insertInto: context)
        add_Cart.setValue(product_Brand, forKey: "product_Brand")
        add_Cart.setValue(product_Name, forKey: "product_Name")
        add_Cart.setValue(product_Price, forKey: "product_Price")
        add_Cart.setValue(product_Discount, forKey: "product_Discount")
        add_Cart.setValue(product_Image, forKey: "product_Image")
        
        do{
            try context.save()
            print("saved")
            
        } catch let error as NSError{
            print("not saved \(error), \(error.userInfo)")
        } catch{
            
        }
    }
    
    //MARK: -fetch from coredata
    func fetchCart() -> [Add_Cart]?{
        var resultArray: [Add_Cart]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName:"Add_Cart")
        fetchRequest.predicate = NSPredicate(value:true)
        fetchRequest.returnsObjectsAsFaults = false
        do{
            resultArray = try getcontext().fetch(fetchRequest) as? [Add_Cart]
            print("add_Cart = \(resultArray!.count)")
        }
        catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        return resultArray
    }
    
    //MARK: -delete from coredata
    func deleteCart(object:Add_Cart) {
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
