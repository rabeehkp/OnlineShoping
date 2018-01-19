//
//  GetCoreDataVariables.swift
//  DemoApp
//
//  Created by Rabeeh KP on 09/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class GetCoreDataVariables: NSObject {

    var brandsForGents = BrandsForGents()
    var brandsForLadies = BrandsForLadies()
    var mens_Shirt = Mens_shirt()
    var mens_SweatShirt = Mens_sweatshirt()
    var mens_Tshirt = Mens_tshirt()
    var womens_Kurta = Women_kurta()
    var womens_Saree = Women_saree()
    var womens_Tops = Women_tops()
    var collection_Brands = Collection_Brands()
    var results_collection_brand = [Collection_Brands]()
    var resultsGents = [BrandsForGents]() // coredata value
    var resultsLadies = [BrandsForLadies]() // coredata value
    var results_mens_Shirt = [Mens_shirt]()
    var results_mens_SweatShirt = [Mens_sweatshirt]()
    var results_mens_Tshirt = [Mens_tshirt]()
    var results_womens_Kurta = [Women_kurta]()
    var results_womens_Saree = [Women_saree]()
    var results_womens_Tops = [Women_tops]()
    //filter data
    var filter_mens_Shirt = [Mens_shirt]()
    var filter_mens_SweatShirt = [Mens_sweatshirt]()
    var filter_mens_Tshirt = [Mens_tshirt]()
    var filter_womens_Kurta = [Women_kurta]()
    var filter_womens_Saree = [Women_saree]()
    var filter_womens_Tops = [Women_tops]()
    //var filterResult = [String]()
    
    //Brand Variables
    var brand = Brand()
    var resultsBrand = [Brand]() //CoreData values
    
    var pro_Image : [UIImage] = []
}
