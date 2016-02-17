//
//  ViewController.swift
//  Indata RSS Data
//
//  Created by IUPUI on 2/9/16.
//  Copyright © 2016 IUPUI. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default  , reuseIdentifier: "Cell")
        
        
        cell.textLabel?.text  = "faskdfh"
        
        return cell
        
    }

}