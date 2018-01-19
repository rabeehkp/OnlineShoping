
//  BrandsVC.swift
//  DemoApp
//
//  Created by Rabeeh KP on 11/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit
import CoreData

class BrandsVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    //MARK: - Enum
    
    
    //MARK: -Variables
    var urlCoreData : String!
    var catagory : String!
    var selectedCatagory : String!
    var sendBrandName : String!
    var store_Brand_func = CodeCheck()
    //Arrays
    var pro_Name : [String] = []
    var pro_Price : [String] = []
    var pro_Discount : [String] = []
    var pro_BrandName : [String] = []
    var pro_ImageUrl : [UIImage] = []
    var pro_sendImgUrl : [String] = []
    var arrays: [String] = []
    var uniqueVal = [String]()
    
    var coreVariables = GetCoreDataVariables()
    var fetch_Store_Functions = Store_FetchFunctions()
    
    
    //MARK: -Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose Brand"
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        tableView.tableFooterView = UIView()
        self.loadFunction()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.reloadData()

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.brandCount() == 0{
            tableView.reloadData()
            return 0
        }
        return self.brandCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let brandCell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath) as! BrandTblCell
        brandCell.brandNameLbl.text = uniqueVal[indexPath.row]
//        let brandCell = UITableViewCell()
//        brandCell.textLabel?.text = uniqueVal[indexPath.row]
//        brandCell.textLabel?.textColor = UIColor.gray
//        brandCell.accessoryType = .disclosureIndicator
        sendBrandName = brandCell.brandNameLbl.text
        
        return brandCell
    }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    if let  destination = storyBoard.instantiateViewController(withIdentifier: "ProductVc") as? ProductVc{
            destination.selectedBrand = uniqueVal[indexPath.row]
            destination.selectedCatagory = selectedCatagory
            destination.urlCoreData = urlCoreData
            destination.catagory = catagory
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
    //MARK: -Table Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //MARK: -Actions for backToProductCatagory
    
    @IBAction func backToProductCatagory(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
    //MARK: FetchAndUpdate
    func fetchAndUpdateTableView(){
        if catagory == "Mens" {
            if let url = urlCoreData{
                switch (url) {
            case "Mens_shirt":
                let shirt = Mens_shirt()
                coreVariables.results_mens_Shirt = shirt.fetchProduct()!
                break
            case "Mens_sweatshirt":
                let  sweatShirt = Mens_sweatshirt()
                coreVariables.results_mens_SweatShirt = sweatShirt.fetchProduct()!
                break
            case "Mens_tshirt":
                let tShirt = Mens_tshirt()
                coreVariables.results_mens_Tshirt = tShirt.fetchProduct()!
                break
            default:
                break
            }
            }
            }else{
                if let url = urlCoreData{
                switch (url) {
            case "Women_kurta":
                let kurta = Women_kurta()
                coreVariables.results_womens_Kurta = kurta.fetchProduct()!
                break
            case "Women_saree":
                let saree = Women_saree()
                coreVariables.results_womens_Saree = saree.fetchProduct()!
                break
            case "Women_tops":
                let tops = Women_tops()
                coreVariables.results_womens_Tops = tops.fetchProduct()!
                break
                default:
                    break
            }
            }
        }
        
        tableView.reloadData()
    }
    
    
    //MARK: get and parse JSON
    
    func processJsonData(resource : String) {
        let path = Bundle.main.path(forResource: resource, ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
            do{
                let object = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
                if let dictionary = object as? NSArray {
                    fetch_Store_Functions.readJSONObject(object: dictionary, catagory: catagory, urlCoreData: urlCoreData)
                }
            } catch {
                // Handle Error
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    //MARK: -Load Function
    func loadFunction(){
        if catagory == "Mens" {
            if let url = urlCoreData{
                switch (url) {
            case "Mens_shirt":
                self.fetchAndUpdateTableView()
                if coreVariables.results_mens_Shirt.count == 0{
                    self.processJsonData(resource: selectedCatagory)
                }else{
                    self.fetchAndUpdateTableView()
                    tableView.reloadData()
                }
                break
            case "Mens_sweatshirt":
                self.fetchAndUpdateTableView()
                if coreVariables.results_mens_SweatShirt.count == 0{
                    self.processJsonData(resource: selectedCatagory)
                    tableView.reloadData()
                }else{
                    self.fetchAndUpdateTableView()
                    tableView.reloadData()
                }
                break
            case "Mens_tshirt":
                self.fetchAndUpdateTableView()
                if coreVariables.results_mens_Tshirt.count == 0{
                    self.processJsonData(resource: selectedCatagory)
                    tableView.reloadData()
                }else{
                    self.fetchAndUpdateTableView()
                    tableView.reloadData()
                }
                break
            default:
                break
            }
            }
        }else{
                if let url = urlCoreData{
                    switch (url) {
                case "Women_kurta":
                    self.fetchAndUpdateTableView()
                    if coreVariables.results_womens_Kurta.count == 0{
                        self.processJsonData(resource: selectedCatagory)
                        tableView.reloadData()
                    }else{
                        self.fetchAndUpdateTableView()
                        tableView.reloadData()
                    }
                    break
                case "Women_saree":
                    self.fetchAndUpdateTableView()
                    if coreVariables.results_womens_Saree.count == 0{
                        self.processJsonData(resource: selectedCatagory)
                        tableView.reloadData()
                    }else{
                        self.fetchAndUpdateTableView()
                        tableView.reloadData()
                    }
                    break
                case "Women_tops":
                    self.fetchAndUpdateTableView()
                    if coreVariables.results_womens_Tops.count == 0{
                        self.processJsonData(resource: selectedCatagory)
                        tableView.reloadData()
                    }else{
                        self.fetchAndUpdateTableView()
                        tableView.reloadData()
                    }
                    break
                    default:
                        break
                }
            }
        }
    }
    
    //MARK: -BrandCount
    func brandCount() -> Int{
        var returnValue = 0
        if catagory == "Mens" {
            if let url = urlCoreData{
                switch (url) {
                case "Mens_shirt":
                   // self.fetchAndUpdateTableView()
                    if coreVariables.results_mens_Shirt.count != 0{
                        self.loop()
                        let vals = arrays
                        let uniqueVals = removeDuplicates(array: vals)
                        if let values = uniqueVals as? [String]{
                            uniqueVal = values
                            returnValue = uniqueVal.count
                        }
                        
                    }
                    else{
                       // self.loadFunction()
                        self.fetchAndUpdateTableView()
                    }
                    break
                case "Mens_sweatshirt":
                   // self.fetchAndUpdateTableView()
                    if coreVariables.results_mens_SweatShirt.count != 0{
                        self.loop()
                        let vals = arrays
                        let uniqueVals = removeDuplicates(array: vals)
                        uniqueVal = uniqueVals
                        returnValue = uniqueVal.count
                    }else{
                       // self.loadFunction()
                        self.fetchAndUpdateTableView()
                    }
                    break
                case "Mens_tshirt":
                   // self.fetchAndUpdateTableView()
                    if coreVariables.results_mens_Tshirt.count != 0{
                        self.loop()
                        let vals = arrays
                        let uniqueVals = removeDuplicates(array: vals)
                        uniqueVal = uniqueVals
                        returnValue = uniqueVal.count
                    }
                    else{
                        self.fetchAndUpdateTableView()
                    }
                    break
                default:
                    break
                }
            }
        }
        else{
            if let url = urlCoreData{
            switch (url) {
                case "Women_kurta":
                   
                   // self.fetchAndUpdateTableView()
                    if coreVariables.results_womens_Kurta.count != 0{
                        self.loop()
                        let vals = arrays
                        let uniqueVals = removeDuplicates(array: vals)
                        uniqueVal = uniqueVals
                        returnValue = uniqueVal.count
                    }
                    else{
                        self.fetchAndUpdateTableView()
                    }
                    break
                case "Women_saree":
                 
                   // self.fetchAndUpdateTableView()
                    if coreVariables.results_womens_Saree.count != 0{
                        self.loop()
                        let vals = arrays
                        let uniqueVals = removeDuplicates(array: vals)
                        uniqueVal = uniqueVals
                        returnValue = uniqueVal.count
                    }
                    else{
                        self.fetchAndUpdateTableView()
                       }
                    break
                case "Women_tops":
                    
                    if coreVariables.results_womens_Tops.count != 0 {
                        self.loop()
                        let vals = arrays
                        let uniqueVals = removeDuplicates(array: vals)
                        uniqueVal = uniqueVals
                        returnValue = uniqueVal.count
                    }
                    else{
                        self.fetchAndUpdateTableView()
                       }
                    break
            default:
                break
                }
            }
        }
        return returnValue
    }
    //MARK: -Remove Duplicates
    func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
                // Do not add a duplicate element.
            }
            else {
                // Add value to the set.
                encountered.insert(value)
                // ... Append the value.
                result.append(value)
            }
        }
        return result
    }
    //MARK: -get brands from coredata
    func loop(){
        if catagory == "Mens" {
            if let url = urlCoreData{
                switch (url) {
            case "Mens_shirt":
                for item in (0..<coreVariables.results_mens_Shirt.count){
                    let brands = coreVariables.results_mens_Shirt[item].product_Brand
                    arrays.append(brands!)
                    pro_BrandName.append(brands!)
                    let price = coreVariables.results_mens_Shirt[item].product_Price
                    pro_Price.append(price!)
                    let discount = coreVariables.results_mens_Shirt[item].product_Discount
                    pro_Discount.append(discount!)
                    let images = coreVariables.results_mens_Shirt[item].product_Image
                    pro_sendImgUrl.append(images!)
                    let name = coreVariables.results_mens_Shirt[item].product_Name
                    pro_Name.append(name!)
                }
                break
            case "Mens_sweatshirt":
                for item in (0..<coreVariables.results_mens_SweatShirt.count){
                    let brands = coreVariables.results_mens_SweatShirt[item].product_Brand
                    arrays.append(brands!)
                    pro_BrandName.append(brands!)
                    let price = coreVariables.results_mens_SweatShirt[item].product_Price
                    pro_Price.append(price!)
                    let discount = coreVariables.results_mens_SweatShirt[item].product_Discount
                    pro_Discount.append(discount!)
                    let images = coreVariables.results_mens_SweatShirt[item].product_Image
                    pro_sendImgUrl.append(images!)
                    let name = coreVariables.results_mens_SweatShirt[item].product_Name
                    pro_Name.append(name!)
                }
                break
            case "Mens_tshirt":
                for item in 0..<(coreVariables.results_mens_Tshirt.count){
                    let brands = coreVariables.results_mens_Tshirt[item].product_Brand
                    arrays.append(brands!)
                    pro_BrandName.append(brands!)
                    let price = coreVariables.results_mens_Tshirt[item].product_Price
                    pro_Price.append(price!)
                    let discount = coreVariables.results_mens_Tshirt[item].product_Discount
                    pro_Discount.append(discount!)
                    let images = coreVariables.results_mens_Tshirt[item].product_Image
                    pro_sendImgUrl.append(images!)
                    let name = coreVariables.results_mens_Tshirt[item].product_Name
                    pro_Name.append(name!)
                }
                break
            default:
                break
            }
            }
        }
        else{
            if let url = urlCoreData{
                switch (url) {
                case "Women_kurta":
                    for item in 0..<(coreVariables.results_womens_Kurta.count){
                        let brands = coreVariables.results_womens_Kurta[item].product_Brand
                        arrays.append(brands!)
                        pro_BrandName.append(brands!)
                        let price = coreVariables.results_womens_Kurta[item].product_Price
                        pro_Price.append(price!)
                        let discount = coreVariables.results_womens_Kurta[item].product_Discount
                        pro_Discount.append(discount!)
                        let images = coreVariables.results_womens_Kurta[item].product_Image
                        pro_sendImgUrl.append(images!)
                        let name = coreVariables.results_womens_Kurta[item].product_Name
                        pro_Name.append(name!)
                    }
                    break
                case "Women_saree":
                    for item in 0..<(coreVariables.results_womens_Saree.count){
                        let brands = coreVariables.results_womens_Saree[item].product_Brand
                        let price = coreVariables.results_womens_Saree[item].product_Price
                        pro_Price.append(price!)
                        let discount = coreVariables.results_womens_Saree[item].product_Discount
                        pro_Discount.append(discount!)
                        let images = coreVariables.results_womens_Saree[item].product_Image
                        pro_sendImgUrl.append(images!)
                        let name = coreVariables.results_womens_Saree[item].product_Name
                        pro_Name.append(name!)
                        arrays.append(brands!)
                        pro_BrandName.append(brands!)
                    }
                    break
                case "Women_tops":
                    for item in 0..<(coreVariables.results_womens_Tops.count){
                        let brands = coreVariables.results_womens_Tops[item].product_Brand
                        arrays.append(brands!)
                        pro_BrandName.append(brands!)
                        let price = coreVariables.results_womens_Tops[item].product_Price
                        pro_Price.append(price!)
                        let discount = coreVariables.results_womens_Tops[item].product_Discount
                        pro_Discount.append(discount!)
                        let images = coreVariables.results_womens_Tops[item].product_Image
                        pro_sendImgUrl.append(images!)
                        let name = coreVariables.results_womens_Tops[item].product_Name
                        pro_Name.append(name!)
                    }
                    break
                default:
                    break
                }
            }
        }
    }
}
