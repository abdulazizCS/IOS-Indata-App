//
//  TableViewCell.swift
//  Indata RSS Data
//
//  Created by IUPUI on 2/14/16.
//  Copyright © 2016 IUPUI. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var userImage1: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userRole: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
