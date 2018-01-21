//
//  AddCartTblCell.swift
//  DemoApp
//
//  Created by Rabeeh KP on 20/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class AddCartTblCell: UITableViewCell {

    
    
    @IBOutlet weak var crossView: UIView!
    @IBOutlet weak var pro_Img: UIImageView!
    @IBOutlet weak var pro_Details: UILabel!
    @IBOutlet weak var pro_MRP: UILabel!
    @IBOutlet weak var pro_Discount: UILabel!
    @IBOutlet weak var pro_Quandity: UITextField!
    @IBOutlet weak var removeFromCoreDataBtn: UIButton!
    @IBOutlet weak var proceedBtn: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
