//
//  UserDetailsViewController.swift
//  Indata RSS Data
//
//  Created by IUPUI on 2/14/16.
//  Copyright © 2016 IUPUI. All rights reserved.
//

import UIKit

var rowCount:Int = 0

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userRoleLabel: UILabel!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userBioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //usernameLabel.text  =  arrayOfNames[rowCount]
        
        userNameLabel.text = arrayOfNames[rowCount]

        userRoleLabel.text = arrayOfRoles[rowCount]
        
        let descText = arrayOfDescriptions[rowCount].stringByReplacingOccurrencesOfString("<p class=\"p1\"><span class=\"s1\">", withString: "")
        
        let descText1 = descText.stringByReplacingOccurrencesOfString("</span><span class=\"s1\">", withString: "")
        let descText2 = descText1.stringByReplacingOccurrencesOfString("</span>", withString: "")
        let descText3 = descText2.stringByReplacingOccurrencesOfString("&nbsp;", withString: "")
        let descText4 = descText3.stringByReplacingOccurrencesOfString("</a>", withString: "")
        let descText5 = descText4.stringByReplacingOccurrencesOfString("<a href=\"", withString: "(")
        let descText6 = descText5.stringByReplacingOccurrencesOfString("\" class=\"external\" rel=\"nofollow\"><span class=\"s2\">", withString: ")")


        let attemptedEmail = arrayOfEmails[rowCount]
        
        let email = attemptedEmail.decodeHTMLEntities().decodedString
        
        
        userEmail.text = email
        userBioLabel.text = descText6

        //print(descText6)
        
        
        let userImageLink = arrayOfLinks[rowCount]
        
         userImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: userImageLink)!)!)
        
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
