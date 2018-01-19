//
//  Women_kurta+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Women_kurta {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Women_kurta> {
        return NSFetchRequest<Women_kurta>(entityName: "Women_kurta")
    }

    @NSManaged public var product_Brand: String?
    @NSManaged public var product_Name: String?
    @NSManaged public var product_Price: String?
    @NSManaged public var product_Discount: String?
    @NSManaged public var product_Image: String?

}
