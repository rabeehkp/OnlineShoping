//
//  Women_tops+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Women_tops {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Women_tops> {
        return NSFetchRequest<Women_tops>(entityName: "Women_tops")
    }

    @NSManaged public var product_Brand: String?
    @NSManaged public var product_Name: String?
    @NSManaged public var product_Price: String?
    @NSManaged public var product_Discount: String?
    @NSManaged public var product_Image: String?

}
