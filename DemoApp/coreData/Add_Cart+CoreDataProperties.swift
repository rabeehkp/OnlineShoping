//
//  Add_Cart+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 20/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Add_Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Add_Cart> {
        return NSFetchRequest<Add_Cart>(entityName: "Add_Cart")
    }

    @NSManaged public var product_Brand: String?
    @NSManaged public var product_Discount: String?
    @NSManaged public var product_Image: String?
    @NSManaged public var product_Name: String?
    @NSManaged public var product_Price: String?

}
