//
//  Store&FetchFunctions.swift
//  DemoApp
//
//  Created by Rabeeh KP on 10/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class Store_FetchFunctions: NSObject {
    var coreVariables = GetCoreDataVariables()
    
    func readJSONObject(object: NSArray,catagory : String, urlCoreData : String){
        for item in 0..<(object.count){
            let product_Details = object[item] as! NSDictionary
            let userPhotoString = product_Details.value(forKey: "thumbnails") as! String
            let discount_Price = product_Details.value(forKey: "discount_price") as! String
            let original_Price = product_Details.value(forKey: "original_price") as! String
            let product_Name = product_Details.value(forKey: "product_name") as! String
            let product_Brand = product_Details.value(forKey: "product_brand") as! String
            self.storeToCoreData(product_Name: product_Name, product_Brand: product_Brand, original_Price: original_Price, discount_Price: discount_Price, userPhotoString: userPhotoString, catagory : catagory, urlCoreData: urlCoreData)
        }
        
    }
    
    //MARK: -Store to coreData
    
    func storeToCoreData(product_Name : String,product_Brand : String,original_Price : String,discount_Price : String,userPhotoString : String,catagory : String, urlCoreData : String){
        if catagory == "Mens"{
                switch (urlCoreData){
                case "Mens_shirt":
                coreVariables.mens_Shirt.StoreProduct(product_Name: product_Name, product_Brand: product_Brand, product_Price: original_Price, product_Discount: discount_Price, product_Image: userPhotoString)
            break
                case "Mens_sweatshirt" :
                coreVariables.mens_SweatShirt.StoreProduct(product_Name: product_Name, product_Brand: product_Brand, product_Price: original_Price, product_Discount: discount_Price, product_Image: userPhotoString)
            break
                case "Mens_tshirt":
                coreVariables.mens_Tshirt.StoreProduct(product_Name: product_Name, product_Brand: product_Brand, product_Price: original_Price, product_Discount: discount_Price, product_Image: userPhotoString)
            break
                default:
                    break
            }
        }
        else{
                switch (urlCoreData){
                case "Women_kurta" :
                coreVariables.womens_Kurta.StoreProduct(product_Name: product_Name, product_Brand: product_Brand, product_Price: original_Price, product_Discount: discount_Price, product_Image: userPhotoString)
            break
                case "Women_saree" :
                coreVariables.womens_Saree.StoreProduct(product_Name: product_Name, product_Brand: product_Brand, product_Price: original_Price, product_Discount: discount_Price, product_Image: userPhotoString)
            break
                case "Women_tops":
                coreVariables.womens_Tops.StoreProduct(product_Name: product_Name, product_Brand: product_Brand, product_Price: original_Price, product_Discount: discount_Price, product_Image: userPhotoString)
                    break
                default:
                    break
                }
            }
        }
    
    func store_To_Cart(Name: String,Brand:String, Price:String,Discount:String,Image:String){
        coreVariables.add_cart.StoreProduct(product_Name: Name, product_Brand: Brand, product_Price: Price, product_Discount: Discount, product_Image: Image)
    }
    
    }


