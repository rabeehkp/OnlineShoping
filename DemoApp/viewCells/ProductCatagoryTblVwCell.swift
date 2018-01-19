//
//  ProductCatagoryTblVwCell.swift
//  DemoApp
//
//  Created by Rabeeh KP on 07/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class ProductCatagoryTblVwCell: UITableViewCell {
    //MARK: -Outlets
    @IBOutlet weak var productCatagoryLbl: UILabel!
    //MARK: -View Methords
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
