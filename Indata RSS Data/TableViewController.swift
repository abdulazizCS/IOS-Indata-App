//
//  TableViewController.swift
//  Indata RSS Data
//
//  Created by IUPUI on 2/14/16.
//  Copyright © 2016 IUPUI. All rights reserved.
//

import UIKit


var arrayOfNames = [String]()
var arrayOfRoles = [String]()
var arrayOfLinks = [String]()
var arrayOfDescriptions = [String]()
var arrayOfEmails = [String]()


class TableViewController: UITableViewController {
    
    var narray = [String]()
    var rarray = [String]()
    var larray = [String]()
    var darray = [String]()
    var earray = [String]()
    
    var names = [String]()
    var rnames = [String]()
    var links = [String]()
    var descs = [String]()
    var emails = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attemptedUrl = NSURL(string: "http://www.eastersealstech.com/about/staff-directory/")
        
        //var namesArray = as String
        
        
        if let url = attemptedUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                
                
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    
                    let websiteArray = webContent?.componentsSeparatedByString("<div class=\"staffFluid indataStaffTitle\">\r\n        <strong>")
                    
                    
                   //print(webContent)
                    
                    if websiteArray!.count > 1 {
                        
                        for var i = 1; i < websiteArray!.count; i++ {
                            
                            self.narray = (websiteArray?[i].componentsSeparatedByString("</strong><br>"))!
                             self.names.append(self.narray[0] )
                            
                        }
                        
                        NSUserDefaults.standardUserDefaults().setObject(self.names, forKey: "arrayOfNames")
                        

                    }
                    
                    
                    let websiteArray1 = webContent?.componentsSeparatedByString("</strong><br>\r\n        ")
                    
                    //print(websiteArray1![2])
                    
                    if websiteArray1!.count > 1 {
                        
                        for var i = 1; i < websiteArray1!.count; i++ {
                            
                            self.rarray = (websiteArray1?[i].componentsSeparatedByString("<br>"))!
                            self.rnames.append(self.rarray[0] )
                            
                        }
                        
                        NSUserDefaults.standardUserDefaults().setObject(self.rnames, forKey: "arrayOfRoles")
                        
                        //print(self.rnames)
                    }
                    
                    
                    let websiteArray2 = webContent?.componentsSeparatedByString("<img class=\"staffFluid\" src=\"")
                    
                    //print(websiteArray1![2])
                    
                    if websiteArray2!.count > 1 {
                        
                        for var i = 1; i < websiteArray2!.count; i++ {
                            
                            self.larray = (websiteArray2?[i].componentsSeparatedByString("\" alt=\""))!
                            self.links.append(self.larray[0])
                            
                        }
                        
                        NSUserDefaults.standardUserDefaults().setObject(self.links, forKey: "arrayOfLinks")
                        
                        //print(self.links)
                    }
                    
                    
                    let websiteArray3 = webContent?.componentsSeparatedByString("<div class=\"staffFluid indataStaffBio\">\r\n<p>")
                    
                    //print(websiteArray1![2])
                    
                    if websiteArray3!.count > 1 {
                        
                        for var i = 1; i < websiteArray3!.count; i++ {
                            
                            self.darray = (websiteArray3?[i].componentsSeparatedByString("</p>"))!
                            
                            self.descs.append(self.darray[0])
                            
                        }
                        
                        NSUserDefaults.standardUserDefaults().setObject(self.descs, forKey: "arrayOfDescriptions")
                        
                        //print(self.descs)
                    }
                    
                    
                    //Emails Array
                
                    let websiteArray4 = webContent?.componentsSeparatedByString("href=\"mailto:")
                    
                    //print(websiteArray1![2])
                    
                    if websiteArray4!.count > 1 {
                        
                        for var i = 1; i < websiteArray4!.count; i++ {
                            
                            self.earray = (websiteArray4?[i].componentsSeparatedByString("\""))!
                            
                            self.emails.append(self.earray[0])
                            
                        }
                        
                        NSUserDefaults.standardUserDefaults().setObject(self.emails, forKey: "arrayOfEmails")
                        
                        //print(self.emails)
                        
 
                        
                    }
                    
                }
                

            }
            
            task.resume()
            
        }
        

        if NSUserDefaults.standardUserDefaults().objectForKey("arrayOfNames") != nil {
            
            arrayOfNames = NSUserDefaults.standardUserDefaults().objectForKey("arrayOfNames") as! [String]
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("arrayOfRoles") != nil {
            
            arrayOfRoles = NSUserDefaults.standardUserDefaults().objectForKey("arrayOfRoles") as! [String]
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("arrayOfLinks") != nil {
            
            arrayOfLinks = NSUserDefaults.standardUserDefaults().objectForKey("arrayOfLinks") as! [String]
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("arrayOfDescriptions") != nil {
            
            arrayOfDescriptions = NSUserDefaults.standardUserDefaults().objectForKey("arrayOfDescriptions") as! [String]
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("arrayOfEmails") != nil {
            
            arrayOfEmails = NSUserDefaults.standardUserDefaults().objectForKey("arrayOfEmails") as! [String]
        }
        

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfNames.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->  UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TableViewCell
        
        
        //let cell = TableViewCell(style: UITableViewCellStyle.Default  , reuseIdentifier: "Cell")
        cell.userImage1.image = UIImage(named: "UGM-default-user")
        
        cell.userImage1.image = UIImage(data: NSData(contentsOfURL: NSURL(string: arrayOfLinks[indexPath.row])!)!)
        
        cell.userImage1.layer.shadowOpacity = 0.5
        cell.userImage1.layer.cornerRadius = cell.userImage1.frame.size.width / 2
        cell.userImage1.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.userImage1.layer.shadowRadius = 15
        cell.userImage1.layer.shadowColor = UIColor.blackColor().CGColor

        
        

        cell.userImage1.layer.shadowOpacity = 0.6
        
        cell.userName?.text = arrayOfNames[indexPath.row]
        cell.userRole?.text = arrayOfRoles[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        
        rowCount = indexPath.row
        
        return indexPath
    }

    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
