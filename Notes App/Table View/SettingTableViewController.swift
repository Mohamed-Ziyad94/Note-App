//
//  SettingTableViewController.swift
//  Notes App
//
//  Created by Mohammed on 8/22/20.
//  Copyright © 2020 Mohammed. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if indexPath.row == 0 {
                //let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                //navigationController?.pushViewController(vc, animated: true)
            
            }else if indexPath.row == 1 {
                let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                navigationController?.pushViewController(vc, animated: true)
            
            }else if indexPath.row == 2 {
                let vc = storyboard?.instantiateViewController(withIdentifier: "AboutAppViewController") as! AboutAppViewController
                navigationController?.pushViewController(vc, animated: true)

            }else if indexPath.row == 3 {
                //let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                //navigationController?.pushViewController(vc, animated: true)
            
            }else if indexPath.row == 4 {
                 navigationController?.dismiss(animated: true, completion: nil)
            }
        }
    }

}


