//
//  Mens_tshirt+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Mens_tshirt {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mens_tshirt> {
        return NSFetchRequest<Mens_tshirt>(entityName: "Mens_tshirt")
    }

    @NSManaged public var product_Brand: String?
    @NSManaged public var product_Image: String?
    @NSManaged public var product_Name: String?
    @NSManaged public var product_Discount: String?
    @NSManaged public var product_Price: String?

}
