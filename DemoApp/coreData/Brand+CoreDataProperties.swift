//
//  Brand+CoreDataProperties.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//
//

import Foundation
import CoreData


extension Brand {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Brand> {
        return NSFetchRequest<Brand>(entityName: "Brand")
    }

    @NSManaged public var mens_Shirt: String?
    @NSManaged public var mens_SweatShirt: String?
    @NSManaged public var mens_Tshirt: String?
    @NSManaged public var womens_Kurta: String?
    @NSManaged public var womens_Saree: String?
    @NSManaged public var womens_Tops: String?

}
