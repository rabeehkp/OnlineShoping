//
//  CodeCheck.swift
//  DemoApp
//
//  Created by Rabeeh KP on 10/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

enum Mens{
    case Mens_shirt
    case Mens_sweatshirt
    case Mens_tshirt
}
enum Ladies{
    case Womens_kurta
    case Womens_saree
    case Womens_tops
}


class CodeCheck: NSObject {
    var coreVariables = GetCoreDataVariables()
    var mens : Mens?
    var ladies : Ladies?
    
    
    func check( catagory : String){
        
        if catagory == "Mens" {
            if let check_Men = mens{
                switch (check_Men) {
                case .Mens_shirt:
                    break
                case .Mens_sweatshirt:
                    break
                case .Mens_tshirt:
                    break
                }
            }
        }
        else{
            if let check_Ladies = ladies{
                switch (check_Ladies) {
                case .Womens_kurta:
                    break
                case .Womens_saree:
                    break
                case .Womens_tops:
                    break
                }
            }
        }
    }
    func storeToBrand(uniqueVal: [String],urlCoreData: String){
        for item in 0..<uniqueVal.count{
            let values = uniqueVal[item]
            coreVariables.brand.StoreBrand(object: values , key: urlCoreData)
        }
    }
    func store_TO_collection(uniqueVal: [String],urlCoreData: String){
        for item in 0..<uniqueVal.count{
            let values = uniqueVal[item]
            coreVariables.collection_Brands.Store_Collection_Brands(object: values , key: urlCoreData)
        }
    }
}
