//
//  Mens_shirt+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Mens_shirt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mens_shirt> {
        return NSFetchRequest<Mens_shirt>(entityName: "Mens_shirt")
    }

    @NSManaged public var product_Brand: String?
    @NSManaged public var product_Name: String?
    @NSManaged public var product_Price: String?
    @NSManaged public var product_Discount: String?
    @NSManaged public var product_Image: String?

}
