//
//  Brand+CoreDataClass.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Brand)
public class Brand: NSManagedObject {
  
    enum CoreData_Fields: String{
        typealias RawValue = String
        case mens_Shirt
        case mens_Tshirt
        case mens_SweatShirt
        case womens_Kurta
        case womens_Saree
        case womens_Tops
    }

    
    
    func getcontext () -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func StoreBrand(object: String, key: String) {
        let context = getcontext()
        let entity = NSEntityDescription.entity(forEntityName: "Brand", in: context)
        let brand = NSManagedObject(entity: entity!, insertInto: context)
        
        if key == "Mens_shirt"{
        brand.setValue(object, forKey: "mens_Shirt")
        }
        else if key == "Mens_sweatshirt"{
        brand.setValue(object, forKey: "mens_SweatShirt")
        }
        else if key == "Mens_tshirt"{
        brand.setValue(object, forKey: "mens_Tshirt")
        }
        else if key == "Women_kurta"{
        brand.setValue(object, forKey: "womens_Kurta")
        }
        else if key == "Women_saree"{
        brand.setValue(object, forKey: "womens_Saree")
        }
        else if key == "Women_tops" {
        brand.setValue(object, forKey: "womens_Tops")
        }
        do{
            try context.save()
            print("saved")
            
        } catch let error as NSError{
            print("not saved \(error), \(error.userInfo)")
        } catch{
            
        }
        
    }
    
    func fetchBrand() -> [Brand]?{
        var resultArray: [Brand]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName:"Brand")
        fetchRequest.predicate = NSPredicate(value:true)
        fetchRequest.returnsObjectsAsFaults = false
        do{
            resultArray = try getcontext().fetch(fetchRequest) as? [Brand]
            print("collection of Brands = \(resultArray!.count)")
        }
        catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        return resultArray
    }
    
    func filterBrand(query: String , key: String) -> [String]?{
        var resultArray: [Brand]?
        let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName:"Brand")
        fetchRequest.predicate = NSPredicate(format: "%@ = YES" , argumentArray: [CoreData_Fields.mens_Shirt.rawValue])
        
        switch (key){
            case "Mens_shirt":
            fetchRequest.predicate = NSPredicate(format: "%@ = YES" , argumentArray: [CoreData_Fields.mens_Shirt.rawValue])
            break
        case "Mens_sweatshirt":
                fetchRequest.predicate = NSPredicate(format: "%@ = YES" , argumentArray: [CoreData_Fields.mens_SweatShirt.rawValue])
            break
        case "Mens_tshirt":
                fetchRequest.predicate = NSPredicate(format: "%@ = YES" , argumentArray: [CoreData_Fields.mens_Tshirt.rawValue])
            break
        case "Women_kurta":
                fetchRequest.predicate = NSPredicate(format: "%@ = YES" , argumentArray: [CoreData_Fields.womens_Kurta.rawValue])
            break
        case "Women_saree" :
              fetchRequest.predicate = NSPredicate(format: "%@ = YES" , argumentArray: [CoreData_Fields.womens_Saree.rawValue])
            break
        case "Women_tops" :
               fetchRequest.predicate = NSPredicate(format: "%@ = YES" , argumentArray: [CoreData_Fields.womens_Tops.rawValue])
            break
        default :
            break
        }
        fetchRequest.returnsObjectsAsFaults = false
        do{
            resultArray = try getcontext().fetch(fetchRequest) as? [Brand]
            print("collection of Brands = \(resultArray!.count)")
        }
        catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
        if let proper_results = resultArray, proper_results.count > 0{
            var keyword : [String] = []
            switch (key){
            case "Mens_shirt":
                let keywords = proper_results.map({ obj -> String in
                    return obj.mens_Shirt!
                })
                keyword = keywords
                break
            case "Mens_sweatshirt":
                let keywords = proper_results.map({ obj -> String in
                    return obj.mens_SweatShirt!
                })
                keyword = keywords
                break
            case "Mens_tshirt":
                let keywords = proper_results.map({ obj -> String in
                    return obj.mens_Tshirt!
                })
                keyword = keywords
                break
            case "Women_kurta":
                let keywords = proper_results.map({ obj -> String in
                    return obj.womens_Kurta!
                })
                keyword = keywords
                break
            case "Women_saree" :
                let keywords = proper_results.map({ obj -> String in
                    return obj.womens_Saree!
                })
                keyword = keywords
                break
            case "Women_tops" :
                let keywords = proper_results.map({ obj -> String in
                    return obj.womens_Tops!
                })
                keyword = keywords
                break
            default :
                break
            }
            return keyword
            
        }
        else{
             return nil
        }
       
    }
}
