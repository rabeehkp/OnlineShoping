//
//  BrandsForLadies+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 08/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension BrandsForLadies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BrandsForLadies> {
        return NSFetchRequest<BrandsForLadies>(entityName: "BrandsForLadies")
    }

    @NSManaged public var product_Brand: String?
    @NSManaged public var product_Discount: String?
    @NSManaged public var product_Image: String?
    @NSManaged public var product_price: String?
    @NSManaged public var product_Name: String?

}
