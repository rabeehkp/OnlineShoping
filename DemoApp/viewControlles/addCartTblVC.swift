//
//  addCartTblVC.swift
//  DemoApp
//
//  Created by Rabeeh KP on 20/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class addCartTblVC: UITableViewController {
    //MARK: -Variables
    var coreDataVariables = GetCoreDataVariables()
    
    //MARK: -ViewMethords
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCart()
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        tableView.tableFooterView = UIView()
    }

    //MARK: -tableView dataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coreDataVariables.result_add_Cart.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cartCell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! AddCartTblCell
        let img = coreDataVariables.result_add_Cart[indexPath.row].product_Image!
        let userPhotoString = img
        let imageUrl:URL = URL(string: userPhotoString)!
        let imageData:Data = try! Data(contentsOf: imageUrl)
        // Add photo to a cell as a subview
        
        if let image = UIImage(data: imageData){
             cartCell.pro_Img.image = image
        }
        cartCell.pro_MRP.text = coreDataVariables.result_add_Cart[indexPath.row].product_Price
        cartCell.pro_Details.text = coreDataVariables.result_add_Cart[indexPath.row].product_Name
        cartCell.pro_Discount.text = coreDataVariables.result_add_Cart[indexPath.row].product_Discount
        if cartCell.pro_Discount.text! == cartCell.pro_MRP.text!{
            cartCell.pro_Discount.isHidden = true
            cartCell.crossView.isHidden = true
        }
        else{
            cartCell.pro_MRP.textColor = UIColor.darkGray
            cartCell.pro_Discount.isHidden = false
            cartCell.crossView.isHidden = false
        }
        cartCell.proceedBtn.tag = indexPath.row
        cartCell.proceedBtn.addTarget(self, action: #selector(addCartTblVC.ProceedTapped(_:)), for: .touchUpInside)
        cartCell.removeFromCoreDataBtn.tag = indexPath.row
        cartCell.removeFromCoreDataBtn.addTarget(self, action: #selector(addCartTblVC.deleteFromCart(_:)), for: .touchUpInside)
        return cartCell
    }
   
    
    //MARK: -fetchFunction
    func fetchCart(){
        let cart = Add_Cart()
        coreDataVariables.result_add_Cart = cart.fetchCart()!
    }
    
    //MARK: -Proceed Action
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func ProceedTapped(_ sender: UIButton) {
        let buttonTag = sender.tag
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "ProductVc") as! ProductVc
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func deleteFromCart(_ sender: UIButton) {
        let buttonTag = sender.tag
        
    }
    
}
