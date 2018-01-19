//
//  GetJsonfileNSObject.swift
//  DemoApp
//
//  Created by Rabeeh KP on 07/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class GetJsonfileNSObject: NSObject {
    
    
    func GetMensJson(){
    var json: [Any]?
    do {
    //json = try JSONSerialization.jsonObject(with: data)
    } catch {
    print(error)
    }
    guard let item = json?.first as? [String: Any],
    let person = item["person"] as? [String: Any],
    let age = person["age"] as? Int else {
    return
    }
    }

}
