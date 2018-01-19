//
//  ProductVc.swift
//  DemoApp
//
//  Created by Rabeeh KP on 06/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ProductVc: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //MARK: -Variables
    var selectedBrand = String()
    var coreVariables = GetCoreDataVariables()
    var myCell = productCellNsObject()
    var urlCoreData : String!
    var catagory : String!
    var selectedCatagory : String!
    var filtered_Brand : Int!
    //Passing variables
    var pro_Name : [String] = []
    var pro_Price : [String] = []
    var pro_Discount : [String] = []
    var pro_Image : [UIImage] = []
    
    //store filter data
    var filter_image : [String] = []
    var filter_Name : [String] = []
    var filter_Price : [String] = []
    var filter_Discount : [String] = []
    
    //MARK: -Outlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: -View Methords
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCoreData()
        self.title = selectedBrand
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
        self.filter_Brands()
        collectionView.delegate = self
    }
    
    //MARK: -CollectionView DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // Number or row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.brandCount() == 0{
            collectionView.reloadData()
            return 0
        }
        return self.brandCount()
    }
    // Cell For item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductViewCell
        var img : UIImage!
        if catagory == "Mens" {
            if let url = urlCoreData {
                switch (url){
                case "Mens_shirt":
                        let img_Url =  coreVariables.filter_mens_Shirt[indexPath.row].product_Image!
                        let price = coreVariables.filter_mens_Shirt[indexPath.row].product_Price
                        let discount =  coreVariables.filter_mens_Shirt[indexPath.row].product_Discount
                        let name = coreVariables.filter_mens_Shirt[indexPath.row].product_Name
                        let userPhotoString = img_Url
                        let imageUrl:URL = URL(string: userPhotoString)!
                        let imageData:Data = try! Data(contentsOf: imageUrl)
                        // Add photo to a cell as a subview
                        
                        if let image = UIImage(data: imageData){
                            img = image
                        }
                        myCell.cellDetails_mens_Shirt(indexPath: indexPath, cell: productCell , img: img, pro_Price: price!, pro_Disc: discount!, pro_name: name!)
                        pro_Price.append(price!)
                        pro_Name.append(name!)
                        pro_Discount.append(discount!)
                        pro_Image.append(img!)
                    
                    break
                case "Mens_sweatshirt" :
                   
                        let img_Url = coreVariables.filter_mens_SweatShirt[indexPath.row].product_Image
                        let price = coreVariables.filter_mens_SweatShirt[indexPath.row].product_Price
                        let discount = coreVariables.filter_mens_SweatShirt[indexPath.row].product_Discount
                        let name = coreVariables.filter_mens_SweatShirt[indexPath.row].product_Name
                        let userPhotoString = img_Url
                        let imageUrl:URL = URL(string: userPhotoString!)!
                        let imageData:Data = try! Data(contentsOf: imageUrl)
                        // Add photo to a cell as a subview
                        
                        if let image = UIImage(data: imageData){
                            img = image
                        }
                        myCell.cellDetails_mens_SweatShirt(indexPath: indexPath, cell: productCell , img: img!, pro_Price: price!, pro_Disc: discount!, pro_name: name!)
                        pro_Price.append(price!)
                        pro_Name.append(name!)
                        pro_Discount.append(discount!)
                        pro_Image.append(img!)
                    break
                case "Mens_tshirt" :
                    
                        let img_Url = coreVariables.filter_mens_Tshirt[indexPath.row].product_Image
                        let price = coreVariables.filter_mens_Tshirt[indexPath.row].product_Price
                        let discount = coreVariables.filter_mens_Tshirt[indexPath.row].product_Discount
                        let name = coreVariables.filter_mens_Tshirt[indexPath.row].product_Name
                        let userPhotoString = img_Url
                        let imageUrl:URL = URL(string: userPhotoString!)!
                        let imageData:Data = try! Data(contentsOf: imageUrl)
                        // Add photo to a cell as a subview
                        
                        if let image = UIImage(data: imageData){
                            img = image
                        }
                        myCell.cellDetails_mens_Tshirt(indexPath: indexPath, cell: productCell , img: img!, pro_Price: price!, pro_Disc: discount!, pro_name: name!)
                        pro_Price.append(price!)
                        pro_Name.append(name!)
                        pro_Discount.append(discount!)
                        pro_Image.append(img!)
                    break
                default:
                    break
                }
            }
        }
        else{
            if let url = urlCoreData {
                switch (url){
                case "Women_kurta" :
                        let img_Url = coreVariables.filter_womens_Kurta[indexPath.row].product_Image
                        let price = coreVariables.filter_womens_Kurta[indexPath.row].product_Price
                        let discount = coreVariables.filter_womens_Kurta[indexPath.row].product_Discount
                        let name = coreVariables.filter_womens_Kurta[indexPath.row].product_Name
                        let userPhotoString = img_Url
                        let imageUrl:URL = URL(string: userPhotoString!)!
                        let imageData:Data = try! Data(contentsOf: imageUrl)
                        // Add photo to a cell as a subview
                        
                        if let image = UIImage(data: imageData){
                            img = image
                        }
                        myCell.cellDetails_womens_Kurta(indexPath: indexPath, cell: productCell , img: img!, pro_Price: price!, pro_Disc: discount!, pro_name: name!)
                        pro_Price.append(price!)
                        pro_Name.append(name!)
                        pro_Discount.append(discount!)
                        pro_Image.append(img!)
                    break
                case "Women_saree" :
                        let img_Url = coreVariables.filter_womens_Saree[indexPath.row].product_Image
                        let price = coreVariables.filter_womens_Saree[indexPath.row].product_Price
                        let discount = coreVariables.filter_womens_Saree[indexPath.row].product_Discount
                        let name = coreVariables.filter_womens_Saree[indexPath.row].product_Name
                        let userPhotoString = img_Url
                        let imageUrl:URL = URL(string: userPhotoString!)!
                        let imageData:Data = try! Data(contentsOf: imageUrl)
                        // Add photo to a cell as a subview
                        
                        if let image = UIImage(data: imageData){
                            img = image
                        }
                        myCell.cellDetails_womens_Saree(indexPath: indexPath, cell: productCell , img: img!, pro_Price: price!, pro_Disc: discount!, pro_name: name!)
                        pro_Price.append(price!)
                        pro_Name.append(name!)
                        pro_Discount.append(discount!)
                        pro_Image.append(img!)
                    break
                case "Women_tops":
                    
                        let img_Url = coreVariables.filter_womens_Tops[indexPath.row].product_Image
                        let price = coreVariables.filter_womens_Tops[indexPath.row].product_Price
                        let discount = coreVariables.filter_womens_Tops[indexPath.row].product_Discount
                        let name =  coreVariables.filter_womens_Tops[indexPath.row].product_Name
                        let userPhotoString = img_Url
                        let imageUrl:URL = URL(string: userPhotoString!)!
                        let imageData:Data = try! Data(contentsOf: imageUrl)
                        // Add photo to a cell as a subview
                        
                        if let image = UIImage(data: imageData){
                            img = image
                        }
                        
                        
                    myCell.cellDetails_womens_Tops(indexPath: indexPath, cell: productCell , img: img!, pro_Price: price!, pro_Disc: discount!, pro_name: name!)
                        pro_Price.append(price!)
                        pro_Name.append(name!)
                        pro_Discount.append(discount!)
                        pro_Image.append(img!)
                    break
                default:
                    break
                }
            }
        }
        
        return productCell
    }
    // did Select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "ProductDetails") as! ViewController
        destination.proName = pro_Name[indexPath.row]
        destination.proMRP = pro_Price[indexPath.row]
        destination.proDiscount = pro_Discount[indexPath.row]
        destination.productImage = pro_Image[indexPath.row]
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    //MARK: -Action Back to brand
    @IBAction func backToBrand(_ sender: UIBarButtonItem) {
        dismiss(animated: false, completion: nil)
    }
    
    //MARK: -Get Count
    func brandCount()-> Int{
        var return_value = 0
        if catagory == "Mens"{
            if let url = urlCoreData{
                switch (url){
                case "Mens_shirt":
                    return_value = coreVariables.filter_mens_Shirt.count
                    break
                case "Mens_sweatshirt":
                    return_value = coreVariables.filter_mens_SweatShirt.count
                    break
                case "Mens_tshirt":
                    return_value = coreVariables.filter_mens_Tshirt.count
                    break
                default:
                    break
                }
            }
        }
        else{
            if let url = urlCoreData{
                switch(url){
                case "Women_kurta":
                    return_value = coreVariables.filter_womens_Kurta.count
                    break
                case "Women_saree":
                    return_value = coreVariables.filter_womens_Saree.count
                    break
                case "Women_tops":
                    return_value = coreVariables.filter_womens_Tops.count
                    break
                default:
                    break
                }
            }
        }
        return return_value
    }
    
    //MARK: -Fetch coreData
    func fetchCoreData(){
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
        
        collectionView.reloadData()
    }
    
   
    //MARK: - Filter Product Brands
        func filter_Brands(){
            if catagory == "Mens"{
                if let url = urlCoreData{
                    switch (url){
                        case "Mens_shirt":
                            let  shirt_Filter = Mens_shirt()
                            coreVariables.filter_mens_Shirt = shirt_Filter.filterBrand(key: urlCoreData, argument_Array: selectedBrand)!
                            collectionView.reloadData()
                        break
                    case "Mens_sweatshirt":
                        let sweatShirt_filter = Mens_sweatshirt()
                        coreVariables.filter_mens_SweatShirt = sweatShirt_filter.filterBrand(key: urlCoreData, argument_Array: selectedBrand)!
                        collectionView.reloadData()
                        
                        break
                    case "Mens_tshirt":
                        let tShirt_filter = Mens_tshirt()
                        coreVariables.filter_mens_Tshirt = tShirt_filter.filterBrand(key: urlCoreData, argument_Array: selectedBrand)!
                        collectionView.reloadData()
                        break
                    default:
                        break
                    }
                }
            }
            else{
                if let url = urlCoreData{
                    switch (url){
                    case "Women_kurta":
                        let kurta_filter = Women_kurta()
                        coreVariables.filter_womens_Kurta = kurta_filter.filterBrand(key: urlCoreData, argument_Array: selectedBrand)!
                        collectionView.reloadData()
                        
                        break
                    case "Women_saree":
                        let saree_filter = Women_saree()
                        coreVariables.filter_womens_Saree = saree_filter.filterBrand(key: urlCoreData, argument_Array: selectedBrand)!
                        collectionView.reloadData()
                        
                        break
                    case "Women_tops":
                        let top_filter = Women_tops()
                        coreVariables.filter_womens_Tops = top_filter.filterBrand(key: urlCoreData, argument_Array: selectedBrand)!
                        collectionView.reloadData()
                        break
                    default:
                        break
                        
                    }
                }
            }
        }
    
    //MARK: -Looping filtered data
    func loop(){
        if catagory == "Mens" {
            if let url = urlCoreData{
                switch (url) {
                case "Mens_shirt":
                    for item in (0..<coreVariables.results_mens_Shirt.count){
                        if coreVariables.results_mens_Shirt[item].product_Brand == selectedBrand{
                        let price = coreVariables.results_mens_Shirt[item].product_Price
                        filter_Price.append(price!)
                        let discount = coreVariables.results_mens_Shirt[item].product_Discount
                        filter_Discount.append(discount!)
                        let images = coreVariables.results_mens_Shirt[item].product_Image
                        filter_image.append(images!)
                        let name = coreVariables.results_mens_Shirt[item].product_Name
                        filter_Name.append(name!)
                    }
                    }
                    break
                case "Mens_sweatshirt":
                    for item in (0..<coreVariables.results_mens_SweatShirt.count){
                        if coreVariables.results_mens_SweatShirt[item].product_Brand == selectedBrand{
                        let price = coreVariables.results_mens_SweatShirt[item].product_Price
                        filter_Price.append(price!)
                        let discount = coreVariables.results_mens_SweatShirt[item].product_Discount
                        filter_Discount.append(discount!)
                        let images = coreVariables.results_mens_SweatShirt[item].product_Image
                        filter_image.append(images!)
                        let name = coreVariables.results_mens_SweatShirt[item].product_Name
                        filter_Name.append(name!)
                        }
                    }
                    break
                case "Mens_tshirt":
                    for item in 0..<(coreVariables.results_mens_Tshirt.count){
                        if coreVariables.results_mens_Tshirt[item].product_Brand == selectedBrand{
                        let price = coreVariables.results_mens_Tshirt[item].product_Price
                        filter_Price.append(price!)
                        let discount = coreVariables.results_mens_Tshirt[item].product_Discount
                        filter_Discount.append(discount!)
                        let images = coreVariables.results_mens_Tshirt[item].product_Image
                        filter_image.append(images!)
                        let name = coreVariables.results_mens_Tshirt[item].product_Name
                        filter_Name.append(name!)
                        }
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
                        if coreVariables.results_womens_Kurta[item].product_Brand == selectedBrand{
                        let price = coreVariables.results_womens_Kurta[item].product_Price
                        filter_Price.append(price!)
                        let discount = coreVariables.results_womens_Kurta[item].product_Discount
                        filter_Discount.append(discount!)
                        let images = coreVariables.results_womens_Kurta[item].product_Image
                        filter_image.append(images!)
                        let name = coreVariables.results_womens_Kurta[item].product_Name
                        filter_Name.append(name!)
                        }
                    }
                    break
                case "Women_saree":
                    for item in 0..<(coreVariables.results_womens_Saree.count){
                        if coreVariables.results_womens_Saree[item].product_Brand == selectedBrand{
                            let price = coreVariables.results_womens_Saree[item].product_Price
                            filter_Price.append(price!)
                            let discount = coreVariables.results_womens_Saree[item].product_Discount
                            filter_Discount.append(discount!)
                            let images = coreVariables.results_womens_Saree[item].product_Image
                            filter_image.append(images!)
                            let name = coreVariables.results_womens_Saree[item].product_Name
                            filter_Name.append(name!)
                        }
                    }
                    break
                case "Women_tops":
                    for item in 0..<(coreVariables.results_womens_Tops.count){
                        if coreVariables.results_womens_Tops[item].product_Brand == selectedBrand{
                            let price = coreVariables.results_womens_Tops[item].product_Price
                            filter_Price.append(price!)
                            let discount = coreVariables.results_womens_Tops[item].product_Discount
                            filter_Discount.append(discount!)
                            let images = coreVariables.results_womens_Tops[item].product_Image
                            filter_image.append(images!)
                            let name = coreVariables.results_womens_Tops[item].product_Name
                            filter_Name.append(name!)
                        }
                    }
                    break
                default:
                    break
                }
            }
        }
    }
    
    }
//MARK: -Custom layout
extension ProductVc: UICollectionViewDelegateFlowLayout{
        fileprivate var sectionInsets: UIEdgeInsets {
            return .zero
        }
        
        fileprivate var itemsPerRow: CGFloat {
            return 2
        }
        
        fileprivate var interitemSpace: CGFloat {
            return 5.0
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
            let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
            let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
            let widthPerItem = availableWidth / itemsPerRow
            let availableHeight = collectionView.bounds.height
            let heightPerItem = availableHeight / itemsPerRow
            
            return CGSize(width: widthPerItem, height: heightPerItem)
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return interitemSpace
        }
}
