//
//  ProductViewTblVc.swift
//  DemoApp
//
//  Created by Rabeeh KP on 06/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class ProductViewTblVc: UITableViewController {

    //MARK: -Variables
    var mensProducts = ["myntra_men_shirt","myntra_men_sweatshirt","myntra_men_tshirt"]
    var mensCoreData = ["Mens_shirt","Mens_sweatshirt","Mens_tshirt"]
    var womensProducts = ["myntra_women_kurta","myntra_women_saree","myntra_women_tops"]
    var womenCoreData = ["Women_kurta","Women_saree","Women_tops"]
    var catagory : String!
   
   
    
    var pro_Name : [String] = []
    var pro_Price : [String] = []
    var pro_Discount : [String] = []
    var pro_BrandName : [String] = []
    var pro_ImageUrl : [UIImage] = []
    
    //MARK: -Outlets
    @IBOutlet weak var backToCatagory: UIBarButtonItem!
    
    //MARK: -View Methords
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.title = "Back"
        self.title = "Choose Catagory"
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
tableView.tableFooterView = UIView()
         }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if catagory == "Mens"{
            return mensProducts.count
        }else{
        return womensProducts.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "proCatCell", for: indexPath) as! ProductCatagoryTblVwCell
        if catagory == "Mens"{
            cell.productCatagoryLbl.text = mensProducts[indexPath.row]
        }
        else{
        cell.productCatagoryLbl.text = womensProducts[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if let  destination = storyBoard.instantiateViewController(withIdentifier: "BrandsVC") as? BrandsVC{
            if catagory == "Mens"{
               destination.selectedCatagory = mensProducts[indexPath.row]
                destination.urlCoreData = mensCoreData[indexPath.row]
            }
            else{
                destination.selectedCatagory = womensProducts[indexPath.row]
                destination.urlCoreData = womenCoreData[indexPath.row]
                
            }
            destination.catagory = catagory
        self.navigationController?.pushViewController(destination, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //MARK: -Action
    @IBAction func backToCatagory(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
    
}
