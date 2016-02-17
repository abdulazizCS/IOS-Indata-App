//
//  ContactUsViewController.swift
//  Indata RSS Data
//
//  Created by IUPUI on 2/15/16.
//  Copyright © 2016 IUPUI. All rights reserved.
//

import UIKit


class ContactUsViewController: UIViewController {

    @IBOutlet weak var contactLabel: UILabel!
    
    
    var contact:String = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let attemptedUrl = NSURL(string: "http://www.eastersealstech.com/contact/")
        
        
        if let url = attemptedUrl {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                
                
                if let urlContent = data {
                    
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                    
                    //print(webContent)
                    
                    let websiteArray = webContent?.componentsSeparatedByString("<div class=\"entry-content\">\n\t\t")
                    
                    //print(websiteArray![1])
                    
                    if websiteArray!.count > 1 {
                        
                        
                        let contactArray = websiteArray![1].componentsSeparatedByString("<p>Or")
                        
                        //print((contactArray[0]))
                        
                        
                        if contactArray.count > 0 {
                            
                            
                        let contactText = contactArray[0].stringByReplacingOccurrencesOfString("<br />", withString: "\n")
                            
                        let contactText1 = contactText.stringByReplacingOccurrencesOfString("<p>", withString: "")
                            
                        let contactText2 = contactText1.stringByReplacingOccurrencesOfString("</p>", withString: "")
                        
                        let contactText3 = contactText2.stringByReplacingOccurrencesOfString("</a>", withString: "")
    
                        let contactText4 = contactText3.stringByReplacingOccurrencesOfString("<a href=\"mailto:tech@eastersealscrossroads.org\">", withString: "")
                            
                        let contactText5 = contactText4.stringByReplacingOccurrencesOfString("<a href=\"mailto:nprieto@eastersealscrossroads.org\">", withString: "")
                            
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.contactLabel?.text = contactText5
                            })


                            
                            
                        }

                       
                           
                    }
                        
                        
                    
                }
                
                
            }
            
            task.resume()
            
        }
        
        
     }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
