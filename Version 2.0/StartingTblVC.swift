//
//  StartingTblVC.swift
//  DemoApp
//
//  Created by Rabeeh KP on 19/01/18.
//  Copyright © 2018 Rabeeh KP. All rights reserved.
//

import UIKit

class StartingTblVC: UITableViewController {

    //MARK: -Variables
    var choose = ["Mens", "Ladies" ]
    
    //MARK: -Outlets
    
    
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
        return choose.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starting_Cell", for: indexPath) as! StartPageCell

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let  storyboard =  UIStoryboard(name: "Storyboard", bundle: nil)
        let  destination = storyboard.instantiateViewController(withIdentifier: "ChooseCatagoryTblVC") as! ChooseCatagoryTblVC
//        destination.catagory = choose[indexPath.row]
        let navController = UINavigationController(rootViewController: destination)
        self.present(navController, animated: true, completion: nil)
    }
    
    //MARK: -Table Delegation
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
