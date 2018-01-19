//
//  Collection_Brands+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 11/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Collection_Brands {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collection_Brands> {
        return NSFetchRequest<Collection_Brands>(entityName: "Collection_Brands")
    }

    @NSManaged public var mens_Shirt: String?
    @NSManaged public var mens_SweatShirt: String?
    @NSManaged public var mens_Tshirt: String?
    @NSManaged public var women_Kurta: String?
    @NSManaged public var women_Saree: String?
    @NSManaged public var women_Top: String?

}
