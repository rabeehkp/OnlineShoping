//
//  ViewController.swift
//  DemoApp
//
//  Created by Rabeeh KP on 06/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -Variables
    var productImage = UIImage()
    var proDiscount : String!
    var proMRP : String!
    var proName : String!
    
    //MARK: -Outlets
    @IBOutlet weak var crossView: UIView!
    @IBOutlet weak var productNameAndDetails: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var productDiscount: UILabel!
    @IBOutlet weak var productMRP: UILabel!
    
    //MARK: -View Methords
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Place Your Order"
        productImageView.image = productImage
        productDiscount.text = proDiscount
        productMRP.text = proMRP
        productNameAndDetails.text = proName
        if productDiscount.text! == productMRP.text!{
            productDiscount.isHidden = true
            crossView.isHidden = true
        }
        else{
            productMRP.textColor = UIColor.darkGray
            productDiscount.isHidden = false
            crossView.isHidden = false
        }
        addToCartBtn.layer.cornerRadius = 2
    }


    //MARK: -Actions
    @IBAction func addToCart(_ sender: UIButton) {
        
    }
    
    @IBAction func backToProduct(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
}

