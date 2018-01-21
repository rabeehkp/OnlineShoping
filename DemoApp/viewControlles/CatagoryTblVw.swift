//
//  CatagoryTblVw.swift
//  DemoApp
//
//  Created by Rabeeh KP on 06/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class CatagoryTblVw: UITableViewController {

    //MARK: -Variables
    var catagoryNames = ["Mens", "Ladies" ]
    
    //MARK: -Outlets
    @IBOutlet weak var showCart: UIButton!
    
    
    //MARK: -View Methords
    override func viewDidLoad() {
        super.viewDidLoad()
tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return catagoryNames.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath) as! CatagoryTblCell
        cell.catagoryLbl.text = catagoryNames[indexPath.row]
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "ProductViewTblVc") as! ProductViewTblVc
        destination.catagory = catagoryNames[indexPath.row]
       self.navigationController?.pushViewController(destination, animated: true)
    }
    
    //MARK: -Table Delegation
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    // MARK: - Navigation Action
    
    @IBAction func showCart(_ sender: UIButton) {
        let  storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "addCartTblVC") as! addCartTblVC
        self.present(destination, animated: true, completion: nil)
    }
    

    

}
