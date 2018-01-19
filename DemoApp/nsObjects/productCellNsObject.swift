//
//  productCellNsObject.swift
//  DemoApp
//
//  Created by Rabeeh KP on 10/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit


class productCellNsObject: NSObject {
    var coreVariables = GetCoreDataVariables()
    
    func product_Details(indexPath :IndexPath, cell : ProductViewCell, filter_Image : String, filter_Price : String, filter_Disc : String,filter_name : String){
        cell.productMRP.text = filter_Price
        cell.productDiscountPrice.text = filter_Disc
        if cell.productDiscountPrice.text! == cell.productMRP.text!{
            cell.productDiscountPrice.isHidden = true
            cell.crossView.isHidden = true
            cell.productMRP.textColor = UIColor(red:71/255.0, green:0/255.0, blue:161/255.0, alpha: 1.0)
        }
        else{
            cell.productMRP.textColor = UIColor.darkGray
            cell.productDiscountPrice.isHidden = false
            cell.crossView.isHidden = false
        }
        let userPhotoString = filter_Image
        let imageUrl:URL = URL(string: userPhotoString)!
        let imageData:Data = try! Data(contentsOf: imageUrl)
        // Add photo to a cell as a subview
        if let image = UIImage(data: imageData){
            cell.productImageView.image = image
            coreVariables.pro_Image.append(image)
        }
        cell.productNameLbl.text = filter_name
        
    }
    
    func cellDetails_mens_Shirt(indexPath :IndexPath, cell : ProductViewCell, img : UIImage , pro_Price : String, pro_Disc : String,pro_name : String){
        cell.productMRP.text = pro_Price
        cell.productDiscountPrice.text = pro_Disc
        if cell.productDiscountPrice.text! == cell.productMRP.text!{
            cell.productDiscountPrice.isHidden = true
            cell.crossView.isHidden = true
            cell.productMRP.textColor = UIColor(red:71/255.0, green:0/255.0, blue:161/255.0, alpha: 1.0)
        }
        else{
            cell.productMRP.textColor = UIColor.darkGray
            cell.productDiscountPrice.isHidden = false
            cell.crossView.isHidden = false
        }
         cell.productImageView.image = img
        cell.productNameLbl.text = pro_name
        
    }
    
    func cellDetails_mens_SweatShirt(indexPath :IndexPath, cell : ProductViewCell, img : UIImage, pro_Price : String, pro_Disc : String,pro_name : String){
        cell.productMRP.text = pro_Price
        cell.productDiscountPrice.text = pro_Disc
        if cell.productDiscountPrice.text! == cell.productMRP.text!{
            cell.productDiscountPrice.isHidden = true
            cell.crossView.isHidden = true
            cell.productMRP.textColor = UIColor(red:71/255.0, green:0/255.0, blue:161/255.0, alpha: 1.0)
        }
        else{
            cell.productMRP.textColor = UIColor.darkGray
            cell.productDiscountPrice.isHidden = false
            cell.crossView.isHidden = false
        }
        cell.productImageView.image = img
        cell.productNameLbl.text = pro_name
    }
    
    func cellDetails_mens_Tshirt(indexPath :IndexPath, cell : ProductViewCell, img : UIImage, pro_Price : String, pro_Disc : String,pro_name : String){
        cell.productMRP.text = pro_Price
        cell.productDiscountPrice.text = pro_Disc
        if cell.productDiscountPrice.text! == cell.productMRP.text!{
            cell.productDiscountPrice.isHidden = true
            cell.crossView.isHidden = true
            cell.productMRP.textColor = UIColor(red:71/255.0, green:0/255.0, blue:161/255.0, alpha: 1.0)
        }
        else{
            cell.productMRP.textColor = UIColor.darkGray
            cell.productDiscountPrice.isHidden = false
            cell.crossView.isHidden = false
        }
        cell.productImageView.image = img
        cell.productNameLbl.text = pro_name
    }
    
    func cellDetails_womens_Kurta(indexPath :IndexPath, cell : ProductViewCell, img : UIImage, pro_Price : String, pro_Disc : String,pro_name : String){
        cell.productMRP.text = pro_Price
        cell.productDiscountPrice.text = pro_Disc
        if cell.productDiscountPrice.text! == cell.productMRP.text!{
            cell.productDiscountPrice.isHidden = true
            cell.crossView.isHidden = true
            cell.productMRP.textColor = UIColor(red:71/255.0, green:0/255.0, blue:161/255.0, alpha: 1.0)
        }
        else{
            cell.productMRP.textColor = UIColor.darkGray
            cell.productDiscountPrice.isHidden = false
            cell.crossView.isHidden = false
        }
        cell.productImageView.image = img
        cell.productNameLbl.text = pro_name
    }
    
    func cellDetails_womens_Saree(indexPath :IndexPath, cell : ProductViewCell, img : UIImage, pro_Price : String, pro_Disc : String,pro_name : String){
        cell.productMRP.text = pro_Price
        cell.productDiscountPrice.text = pro_Disc
        if cell.productDiscountPrice.text! == cell.productMRP.text!{
            cell.productDiscountPrice.isHidden = true
            cell.crossView.isHidden = true
            cell.productMRP.textColor = UIColor(red:71/255.0, green:0/255.0, blue:161/255.0, alpha: 1.0)
        }
        else{
            cell.productMRP.textColor = UIColor.darkGray
            cell.productDiscountPrice.isHidden = false
            cell.crossView.isHidden = false
        }
        cell.productImageView.image = img
        cell.productNameLbl.text = pro_name
        
    }
    
    func cellDetails_womens_Tops(indexPath :IndexPath, cell : ProductViewCell, img : UIImage, pro_Price : String, pro_Disc : String,pro_name : String){
        cell.productMRP.text = pro_Price
        cell.productDiscountPrice.text = pro_Disc
        if cell.productDiscountPrice.text! == cell.productMRP.text!{
            cell.productDiscountPrice.isHidden = true
            cell.crossView.isHidden = true
            cell.productMRP.textColor = UIColor(red:71/255.0, green:0/255.0, blue:161/255.0, alpha: 1.0)
        }
        else{
            cell.productMRP.textColor = UIColor.darkGray
            cell.productDiscountPrice.isHidden = false
            cell.crossView.isHidden = false
        }
        cell.productImageView.image = img
        cell.productNameLbl.text = pro_name
        
    }
    
    
    
}
