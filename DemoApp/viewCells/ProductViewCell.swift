//
//  ProductViewCell.swift
//  DemoApp
//
//  Created by Rabeeh KP on 06/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    //MARK: -Outlets
    
    @IBOutlet weak var crossView: UIView!
    @IBOutlet weak var productDiscountPrice: UILabel!
    @IBOutlet weak var productMRP: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        if productMRP == productDiscountPrice{
            crossView.isHidden = false
        }else{
            crossView.isHidden = true
        }
    }
}
