//
//  JsonMapper.swift
//  DemoApp
//
//  Created by Rabeeh KP on 08/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//


import ObjectMapper

class JsonMapper: Mappable {
    var thumbnails = String()
    var product_brand = String()
    var product_name = String()
    var original_price = String()
    var discount_price = String()
    var discount = String()
    var available_size = String()
    
    
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        thumbnails <- map["thumbnails"]
        product_brand <- map["product_brand"]
        product_name <- map["product_name"]
        original_price <- map ["original_price"]
        discount_price <- map ["discount_price"]
        discount <- map ["discount"]
        available_size <- map ["available_size"]
    }
    

}
