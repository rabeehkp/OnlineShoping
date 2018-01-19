//
//  Women_saree+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Women_saree {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Women_saree> {
        return NSFetchRequest<Women_saree>(entityName: "Women_saree")
    }

    @NSManaged public var product_Brand: String?
    @NSManaged public var product_Name: String?
    @NSManaged public var product_Price: String?
    @NSManaged public var product_Discount: String?
    @NSManaged public var product_Image: String?

}
